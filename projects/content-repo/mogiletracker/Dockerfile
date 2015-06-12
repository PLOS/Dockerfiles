FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -y cpanminus build-essential libmysqlclient-dev mysql-client && \
    cpanm install --force MogileFS::Server && \
    cpanm install DBD::mysql && \
    cpanm install MogileFS::Utils

RUN mkdir /tracker
WORKDIR /tracker
ADD ./mogilefsd.conf /tracker/mogilefsd.conf
ADD ./run.sh /tracker/run.sh

EXPOSE 7001

CMD bash -x ./run.sh
