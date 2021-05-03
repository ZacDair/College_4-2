import datetime
import redis
import grpc
import logging

import reddit_simulation_pb2_grpc
import reddit_simulation_pb2

# REPLACE THIS WITH A PID ?
CLIENT_ID = 1

# Function that handles asking for data and the stream of responses
def server_streaming_method(stub):
    
    print("Asking Server to start the Dataflow")

    # Create an initial request telling the server the client is ok to receive data
    request = reddit_simulation_pb2.Request(client_id=CLIENT_ID,
                               request_data="Ready For Data")

    # Retrieve the response from the StartDatastream function
    response_iterator = stub.StartDatastream(request)
    for response in response_iterator:
        # Print a basic message showing the reddit post was recieved
        print("received from post server, postID=%s" %(response.post_id))

        # Create a string containing all the fields of the Reddit Post (response)
        postDetails = response.post_id + " , " + response.title + " , " + str(response.score) + " , " +\
            response.author + " , " + response.author_flair + " , " + response.removed_by + " , " +\
            str(response.total_awards) + " , " + response.awarders + " , " + str(response.created_timestamp) + " , " +\
            response.link + " , " + str(response.num_comments) + " , " + str(response.over_18) + " , " + str(datetime.datetime.now())
        
        # Store a basic log message and the reddit post 
        try:
            conn = redis.StrictRedis(host='redis', port=6379)
            conn.set("log.client." + str(datetime.datetime.now()), "Reddit Post:" + response.post_id)
            conn.set("post." + response.post_id, postDetails)
        except Exception as ex:
            print('Error:', ex)

    print("Dataflow has ended")


# Main function for creating the stub and connecting to the server
def main():
    
    with grpc.insecure_channel('a02-server:50051') as channel:
        stub = reddit_simulation_pb2_grpc.DataStreamingServiceStub(channel)
        server_streaming_method(stub)


if __name__ == '__main__':
    logging.basicConfig()
    main()
