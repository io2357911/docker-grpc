FROM debian:stretch-slim

RUN apt-get update && apt-get install -y build-essential autoconf libtool pkg-config wget git unzip curl cmake

WORKDIR /root

RUN \
    cd /tmp && \
    git clone --recursive -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc && \
    cd /tmp/grpc && make && make install && \
    cd /tmp/grpc/third_party/protobuf && make install && \
    rm -rf /tmp/grpc
