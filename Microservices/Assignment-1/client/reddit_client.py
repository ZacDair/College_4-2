from __future__ import print_function
import logging

import grpc

from pb2_modules.reddit_simulation_pb2_grpc import *
from pb2_modules.reddit_simulation_pb2_ import *

def run():
    with grpc.insecure_channel('localhost:50051') as channel:
        stub = reddit_simulation_pb2_grpc.GreeterStub(channel)
        response = stub.SayHello(reddit_simulation_pb2.HelloRequest(name='you'))
    print("Greeter client received: " + response.message)


if __name__ == '__main__':
    logging.basicConfig()
    run()
