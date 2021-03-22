from threading import Thread
from concurrent import futures

import grpc
import reddit_simulation_pb2_grpc
import reddit_simulation_pb2

SERVER_ADDRESS = "localhost:23333"
SERVER_ID = 1

class Server(reddit_simulation_pb2_grpc.DataStreamingServiceServicer):
    def StartDatastream(self, request, context):
        print("ServerStreamingMethod called by client(%d), message= %s" %
              (request.client_id, request.request_data))

        def response_messages():
            for i in range(5):
                response = reddit_simulation_pb2.Response(
                    server_id=SERVER_ID,
                    response_data=("send by Python server, message=%d" % i))
                yield response

        return response_messages()

def main():
    server = grpc.server(futures.ThreadPoolExecutor())

    reddit_simulation_pb2_grpc.add_DataStreamingServiceServicer_to_server(Server(), server)

    server.add_insecure_port(SERVER_ADDRESS)
    print("------------------start Python GRPC server")
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
