FROM ubuntu:trusty

RUN apt-get update && apt-get install -y build-essential cpanminus && \
    cpanm install --force MogileFS::Server

RUN mkdir -p /node/device/dev1
WORKDIR /node
ADD ./mogstored.conf /node/mogstored.conf
EXPOSE 7500

CMD ["mogstored", "-c", "./mogstored.conf"]
