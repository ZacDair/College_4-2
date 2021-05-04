from flask import Flask, render_template, jsonify, request, Response

import redis
import datetime
import time

from appmetrics import metrics

import matplotlib.pyplot as plt
from matplotlib.backends.backend_agg import FigureCanvasAgg
import io
import requests as req


# Alter the default template path with our custom location
webpagePath = "webpages/"
app = Flask(__name__, template_folder=webpagePath)

# Define Our Monitoring Metrics
metrics.new_histogram("ping")
metrics.new_meter("request_count")

# Helper functions to start and end timers when requests are made
def start_timer():
    request.start_time = time.time()
    metrics.metric("request_count").notify(1)

        
def stop_timer(response):
    resp_time = (time.time() - request.start_time)*1000
    metrics.metric("ping").notify(resp_time)
    return response


# Initialise when to run the above helpers
def setup_metrics(my_app):  
    my_app.before_request(start_timer)
    my_app.after_request(stop_timer)


# Connect our helpers to the app
setup_metrics(app)


# Logging function when /logs is accessed, this shows the data flow on a basic level
@app.route('/logs')
def print_logs():
    output = ''
    try:
        conn = redis.StrictRedis(host='redis', port=6379)
        for key in conn.scan_iter("post.*"):
            value = str(conn.get(key))
            output += "<h3>"+str(key)+":</h3>" + value + '<br>'
    except Exception as ex:
        output = 'Error:' + str(ex)
    return output


# Main dashboard function, retrieves the full post data and calculates the metrics and renders our dashboard template
@app.route('/main')
def dashboard():

    # Split the post details into a dict
    def getPostDataAsDict(post):
        
        # Init a list of field names
        postFields = ["post_ID", "title", "score", "author", "author_flair", "removed_by", "total_awards", "awarders", "created_timestamp", "link", "num_comments", "over_18", "actual_time"]

        # Split the list using commas as a delimiter
        postData = post.split(", ")

        # Store key-value pairs (key=postField[x]) (value=postData[x])
        res = {}

        # Loop through the postData entries storing the key value pairs
        fieldIndex = 0
        for val in postData:
            res[postFields[fieldIndex]] = val
            fieldIndex += 1

        return res

    # Store post details as large output string
    output = ''

    # Store all the posts
    posts = []

    # (Metric 1) Average Username Length
    avgUsernameLength = 0

    # (Metric 2) Number of posts removed in the last 3 minutes
    numPostsRemoved = 0

    # (Metric 3) Posts with the most and least words
    longestPost = ""
    shortestPost = ""
    longestWordCount = 0
    shortestWordCount = 1000000

    # (Metric 4) Most active author
    authors = {}
    mostActiveAuthor = ""
    
    # Store the sum of all username lengths (Metric 1)
    totalUsernameLength = 0

    # Get the current time
    currentTime = datetime.datetime.now()
    
    try:
        conn = redis.StrictRedis(host='redis', port=6379)

        # For each post recevied
        for key in conn.scan_iter("post*"):
            
            # Store the value and appened to a large output string
            value = conn.get(key)
            #output += value + '<br>'

            # Parse value into a dict
            value = value.decode("utf-8")
            postDetails = getPostDataAsDict(value)
            output += str(postDetails) + '<br>'
            posts.append(postDetails)

            # Add the username length to the total for avg calculation (Metric 1)
            totalUsernameLength += len(postDetails["author"])

            # Check if this post was sent within 3 minutes, and if so check if it was removed (TODO convert to single if statement)
            if (currentTime - datetime.datetime.strptime(postDetails["actual_time"], "%Y-%m-%d %H:%M:%S.%f")) <= datetime.timedelta(minutes=3):
                if postDetails["removed_by"] != " ":
                    numPostsRemoved += 1
            else:
                numPostsRemoved = 0
                currentTime = datetime.datetime.now()

            # Count the number of words in the title
            wordCount = len(postDetails["title"].split(" "))

            # Compare the word count to the longest and shortest counts (Metric 3)
            if wordCount > longestWordCount:
                longestWordCount = wordCount
                longestPost = postDetails

            if wordCount < shortestWordCount:
                shortestWordCount = wordCount
                shortestPost = postDetails

            # Store the author and increment the count of posts provided the post wasn't removed
            if postDetails["removed_by"] == " ":
                if postDetails["author"] in authors:
                    authors[postDetails["author"]] += 1
                else:
                    authors[postDetails["author"]] = 1
                 
    except Exception as ex:
        output = 'Error:' + str(ex)

    # Calculate the avg username length (Metric 1)
    if posts and (totalUsernameLength != 0):
        avgUsernameLength = str(round(totalUsernameLength/len(posts), 2))
    else:
        avgUsernameLength = 0

    # Find the most author with the most posts
    if authors:
        mostActiveAuthor = max(authors, key=authors.get)
    else:
        mostActiveAuthor = "N/A"
    
    return render_template("dashboard.html", postCount=len(posts), avgUsernameLength=avgUsernameLength, numPostsRemoved=numPostsRemoved, mostActiveAuthor=mostActiveAuthor, longestPost=longestPost, shortestPost=shortestPost, posts=posts)


# Metrics Monitoring Route
@app.route('/monitor')
def monitor():
    response = {
            "success": True,
            "status_code": 200,
            "metrics": {"request_count":metrics.metric("request_count").get(),
                        "ping_histogram":metrics.metric("ping").get()}
    }
    return jsonify(response)

# Metrics Monitoring - 5 Request Ping Test
@app.route('/monitor/pingtest')
def monitor_pingtest():
    # Store the iterations, ping and ping status counts
    iterations = []
    meanPing = []
    pingResults = {"Success": 0, "Failed": 0}

    # Loop n times, performing a request and storing the result and ping
    i = 1
    while i <= 5:
        r = req.get("http://localhost:5000/main")
        if r.status_code == 200:
            pingResults["Success"] += 1
        else:
            pingResults["Failed"] += 1
        iterations.append(str(i))
        meanPing.append(metrics.metric("ping").get()["arithmetic_mean"])
        i+=1

    # Plot the ping graph
    fig = plt.Figure()
    axis = fig.add_subplot(1, 1, 1)
    axis.plot(iterations, meanPing)
    axis.set_xlabel("Requests")
    axis.set_ylabel("Mean Ping (ms)")
    title = "Server Pingtest\n(Successful: " + str(pingResults["Success"]) + " Failed: " + str(pingResults["Failed"]) + ")"
    axis.set_title(title)
    bytesOutput = io.BytesIO()
    FigureCanvasAgg(fig).print_png(bytesOutput)
    return Response(bytesOutput.getvalue(), mimetype='image/png')

# Destination of the ping measuring tool
@app.route('/monitor/ping-dest')
def ping_test_destination():
    return "OK"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
