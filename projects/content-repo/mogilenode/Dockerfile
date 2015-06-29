FROM ubuntu:trusty

RUN apt-get update && apt-get install -y build-essential cpanminus && \
    cpanm install --force MogileFS::Server

RUN mkdir -p /node/device/dev1
WORKDIR /node
ADD ./mogstored.conf /node/mogstored.conf

# hack to deal with Docker/DeviceMapper issue since Mogile will only use local filesystems
# RUN echo "$(which df) \$(echo \$@ | sed s/-l//)" > /root/df; chmod 755 /root/df
ENV PATH /root:$PATH
RUN which df

EXPOSE 7500

CMD ["mogstored", "-c", "./mogstored.conf"]
