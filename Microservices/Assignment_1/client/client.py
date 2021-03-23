import datetime
import redis
import grpc
import logging

import reddit_simulation_pb2_grpc
import reddit_simulation_pb2



CLIENT_ID = 1


def server_streaming_method(stub):
    print("--------------Call ServerStreamingMethod Begin--------------")
    request = reddit_simulation_pb2.Request(client_id=CLIENT_ID,
                               request_data="Ready For Data")
    response_iterator = stub.StartDatastream(request)
    for response in response_iterator:
        print("recv from server, message=%s" %
              (response.post_id))
        try:
            conn = redis.StrictRedis(host='redis', port=6379)
            conn.set("log.client." + str(datetime.datetime.now()), "Reddit Post:" + response.post_id)
        except Exception as ex:
            print('Error:', ex)

    print("--------------Call ServerStreamingMethod Over---------------")


def main():
    with grpc.insecure_channel('server:50051') as channel:
        stub = reddit_simulation_pb2_grpc.DataStreamingServiceStub(channel)
        server_streaming_method(stub)


if __name__ == '__main__':
    logging.basicConfig()
    main()
