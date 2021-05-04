from flask import Flask, jsonify
import subprocess
from subprocess import PIPE
import re
import redis


app = Flask(__name__)

# Test the pod status
@app.route('/api/tests/pods')
def test_pod_count():
    # Run the kubectl get pods command
    cmdOutput = subprocess.run(["k3s", "kubectl", "get", "pods"], stdout=PIPE, stderr=PIPE)
    
    # Convert the command output to a string
    strStdout = str(cmdOutput.stdout, 'utf-8')

    # If the command failed display the error
    if strStdout == "":
        response = {
            "success": False,
            "status_code": 500,
            "message": {"Error":"Error - Unable to complete test command",
                        "Details": str(cmdOutput.stderr, 'utf-8')
                        }
        }
        return jsonify(response)

    # Split the output line by line (removing the header and tail)
    outputLines = strStdout.split("\n")
    outputLines.pop(0)
    outputLines.pop(-1)

    # For each pod track the details
    result = {}
    runningCount = 0
    for line in outputLines:
    
        # Remove extra spaces
        line = re.sub(' +', ' ', line)
    
        # Split into words
        podDetails = line.split(" ")

        # Store pod details
        result[podDetails[0]] = {
            "Name": podDetails[0],
            "Ready":podDetails[1],
            "Status":podDetails[2],
            "Restarts":podDetails[3],
            "Age":podDetails[4]}

        # Store the number of running pods
        if podDetails[2] == "Running":
            runningCount += 1

    # Output the result
    if len(outputLines) == runningCount:
        response = {
            "success": True,
            "status_code": 200,
            "message": result
        }
    else:
        response = {
            "success": False,
            "status_code": 500,
            "message": {"Error":"Error - Detected Some Pods Not Running",
                        "Details":result
                        }
        }
    return jsonify(response)


# Test the accessibility of the redis datastore on port 6379
@app.route('/api/tests/redis')
def test_redis():
    try:
        conn = redis.StrictRedis(host='redis', port=6379)
        response = {
            "success": True,
            "status_code": 200,
            "message": "Redis Datastore Available on port 6379"
        }
        return jsonify(response)
    except Exception as ex:
        response = {
            "success": False,
            "status_code": 500,
            "message": "Error - " + str(ex)
        }
        return jsonify(response)


@app.route('/')
def main(self, event = None):
    return "<h1>Testing API</h1><br><h3>Test Endspoints:</h3><br><h2>locahost:5000/api/tests/redis</h2><br><h2>localhost:5000/api/tests/pods</h2>"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8081)
    

    
