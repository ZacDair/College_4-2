from flask import Flask

import redis
import datetime

app = Flask(__name__)

@app.route('/')
def print_logs():
    output = ''
    try:
        conn = redis.StrictRedis(host='redis', port=6379)
        for key in conn.scan_iter("log.client*"):
            value = str(conn.get(key))
            output += str(key) + value + '<br>'
    except Exception as ex:
        output = 'Error:' + str(ex)
    return output


@app.route('/main')
def dashboard():
    output = ''
    try:
        conn = redis.StrictRedis(host='redis', port=6379)
        for key in conn.scan_iter("client.post*"):
            value = str(conn.get(key))
            output += str(key) + value + '<br>'
    except Exception as ex:
        output = 'Error:' + str(ex)
    return output

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')



def averageUsernameLength(data):

    pass

def numberOfPostsRemoved(data, timeframe):
    pass


def getPostDataAsList(post):
    # Init a list of field names
    postFields = ["post_ID", "title", "score", "author", "author_flair", "removed_by", "total_awards", "awarders", "created_timestamp", "link", "num_comments", "over_18", "actual_time"]

    # Split the list using commas as a delimiter
    postData = post.split(" , ")

    # Store key-value pairs (key=postField[x]) (value=postData[x])
    res = {}

    # Loop through the postData entries storing the key value pairs
    fieldIndex = 0
    for value in postData:
        res[postFields[fieldIndex]] = value
        fieldIndex += 1

    return res
