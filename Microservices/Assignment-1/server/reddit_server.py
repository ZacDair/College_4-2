# Server file
# Responsible for creating the stream of data from the csv to the client for analysis

# Imports
from concurrent import futures
import logging
import datetime
import grpc

from pb2_modules.reddit_simulation_pb2_grpc import *
from pb2_modules.reddit_simulation_pb2_ import *

import redis


# 
class server(reddit_pb2_grpc.Server):

    def SayHello(self, request, context):
        response = reddit_simulation_pb2.HelloReply(message='Hello, %s!' % request.name)
        try:
            conn = redis.StrictRedis(host='redis', port=6379)
            conn.set("log.greeter_server." + str(datetime.datetime.now()), "SayHello: " + request.name)
        except Exception as ex:
            print('Error:', ex)
        return response

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    reddit_simulation_pb2_grpc.add_GreeterServicer_to_server(Greeter(), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    server.wait_for_termination()


if __name__ == '__main__':
    logging.basicConfig()
    serve()