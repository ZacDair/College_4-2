from threading import Thread
from concurrent import futures

import grpc
import reddit_simulation_pb2_grpc
import reddit_simulation_pb2
import logging

import random
import time
import os

DATASET_PATH = os.getenv("DATASET_PATH")


# Function to read and parse the dataset entries
def getRows(datasetPath):
    data = []
    with open(datasetPath, 'r', errors='ignore') as file:
        rows = file.readlines()
        rows.pop(0)
    file.close()
    return rows

    
# Servicer Class
class Server(reddit_simulation_pb2_grpc.DataStreamingServiceServicer):

    # Function trigged by the client to start the data flow
    def StartDatastream(self, request, context):
        print("StartDatastream called by client(%d), message= %s" %
              (request.client_id, request.request_data))

        # Function to retrieve and send the reddit post data to the client (between 1-5 posts every 2 seconds)
        def send_dataPosts():
            
            # Retrieve the whole dataset
            data = getRows(DATASET_PATH)
            
            # Define a number of posts to send every run and store a running count
            numToSend = random.randint(1, 5)
            postCount = 0

            # Loop through every entry of the dataset parse and convert to a list, and send each to the client
            for post in data:
                post = post.strip()
                post = post.encode('ascii', 'ignore').decode('ascii')
                post = post.split(",")

                # Change data format of Youtube data to fit old Reddit format
                dataID = "RD-"
                if DATASET_PATH == "datasource/GBvideos.csv":
                    dataID = "YT-"
                    if len(post) == 16:
                        # Remove and re-arrange data to match the reddit format
                        post.pop(1)
                        post.pop(3)
                        post.pop(3)
                        post.pop(3)
                        post.pop(4)
                        post.pop(4)
                        post.insert(2, 1)
                        post.insert(4, "no-flair")
                        post.insert(5, "")
                        post.insert(7, "")
                        post.insert(8, time.time())
                        post.insert(9, post.pop(10))
                        post = post[0:12]
            
                if len(post) == 12:
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
                        time.sleep(1)
                
        return send_dataPosts()


def main():
    print("Running...")
    # Create a GRPC.Server object
    server = grpc.server(futures.ThreadPoolExecutor())
    
    # Add the DataStreamingServiceServicer to the server
    reddit_simulation_pb2_grpc.add_DataStreamingServiceServicer_to_server(Server(), server)
    
    # Define the port to run the Server on
    server.add_insecure_port('[::]:50051')
    
    # Start our server
    print("Starting Server...")
    server.start()
    server.wait_for_termination()


if __name__ == '__main__':
    main()
