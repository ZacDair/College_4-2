from threading import Thread
from concurrent import futures

import grpc
import reddit_simulation_pb2_grpc
import reddit_simulation_pb2

# Define Global Attributes (Server Address and ID)
SERVER_ADDRESS = "localhost:23333"
SERVER_ID = 1


# Function to read and parse the dataset entries
def getData(datasetPath):
    data = []
    with open(datasetPath, 'r', errors='ignore') as file:
        rows = file.readlines()
        rows.pop(0)
        for row in rows:
            row = row.strip()
            row = row.split(",")
            if len(row) == 12:
                data.append(row)
    file.close()
    return data

    
# Servicer Class
class Server(reddit_simulation_pb2_grpc.DataStreamingServiceServicer):

    # Function trigged by the client to start the data flow
    def StartDatastream(self, request, context):
        print("StartDatastream called by client(%d), message= %s" %
              (request.client_id, request.request_data))

        def send_dataPosts():
            data = getData("datasource/short.xls")
            for post in data:
                print("Sending Post:", str(post[0]))
                response = reddit_simulation_pb2.DatasourcePost(
                    post_id = post[0],
                    title = post[1],
                    score = int(post[2]),
                    author = post[3],
                    author_flair = post[4],
                    removed_by = post[5],
                    total_awards = int(float(post[6])),
                    awarders = post[7],
                    created_timestamp = int(post[8]),
                    link = post[9],
                    num_comments = int(post[10]),
                    over_18 = bool(post[11])
                    )
                yield response

        return send_dataPosts()


def main():
    # Create a GRPC.Server object
    server = grpc.server(futures.ThreadPoolExecutor())
    
    # Add the DataStreamingServiceServicer to the server
    reddit_simulation_pb2_grpc.add_DataStreamingServiceServicer_to_server(Server(), server)
    
    # Define the port to run the Server on
    server.add_insecure_port(SERVER_ADDRESS)
    
    # Start our server
    print("Starting Server...")
    server.start()
    server.wait_for_termination()

    # If raise Error:
    #   AttributeError: '_Server' object has no attribute 'wait_for_termination'
    # You can use the following code instead:
    # import time
    # while 1:
    #     time.sleep(10)


if __name__ == '__main__':
    main()
