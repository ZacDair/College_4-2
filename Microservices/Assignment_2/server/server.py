from threading import Thread
from concurrent import futures

import grpc
import reddit_simulation_pb2_grpc
import reddit_simulation_pb2
import logging

import random
import time
import os

print(os.listdir(os.path.curdir))
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

        # Function to retrieve and send the reddit post data to the client (between 1-5 posts every 2 seconds)
        def send_dataPosts():
            
            # Retrieve the whole dataset TODO: Look at only pulling the numToSend lines from the file
            data = getData("short.xls")
            
            # Define a number of posts to send every run and store a running count
            numToSend = random.randint(1, 5)
            postCount = 0

            # Loop through every entry of the dataset sending each to the client
            for post in data:
                postCount += 1
                print("Sending Post:", str(post[0]))

                # Create the DatasourcePost object and send it
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

                # If we have sent the max posts per run - sleep and reset our dataflow control variables
                if postCount == numToSend:
                    postCount = 0
                    numToSend = random.randint(1, 5)
                    time.sleep(2)
                

        return send_dataPosts()


def main():
    print("Running...")
    # Create a GRPC.Server object
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    
    # Add the DataStreamingServiceServicer to the server
    reddit_simulation_pb2_grpc.add_DataStreamingServiceServicer_to_server(Server(), server)
    
    # Define the port to run the Server on
    server.add_insecure_port('[::]:50051')
    
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
    logging.basicConfig()
    main()
