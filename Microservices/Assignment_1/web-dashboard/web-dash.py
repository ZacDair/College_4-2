from flask import Flask

import redis

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
