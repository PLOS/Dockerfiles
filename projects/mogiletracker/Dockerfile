FROM alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk update && apk add mysql-client bash curl \
  wget make gcc g++ git patch perl perl-dev && \
  curl -L https://cpanmin.us | perl - App::cpanminus && \
  cpanm install --force MogileFS::Server && \
  # cpanm install DBD::mysql && \
  cpanm install MogileFS::Utils

# RUN apt-get update && \
#     apt-get install -y cpanminus build-essential libmysqlclient-dev mysql-client && \
#     cpanm install --force MogileFS::Server && \
#     cpanm install DBD::mysql && \
#     cpanm install MogileFS::Utils

RUN mkdir /tracker
WORKDIR /tracker
ADD ./mogilefsd.conf /tracker/mogilefsd.conf
ADD ./run.sh /tracker/run.sh

EXPOSE 7001

CMD bash -x ./run.sh
