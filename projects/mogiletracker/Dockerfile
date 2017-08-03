FROM alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk --no-cache add mysql-client bash sudo curl perl perl-dbd-mysql && \
  apk --no-cache add --virtual .build-deps wget make gcc g++ git patch  perl-dev && \
  curl -L https://cpanmin.us | perl - App::cpanminus && \
  cpanm install --notest --force MogileFS::Server MogileFS::Utils && \
  apk del .build-deps && rm -rf /root/.cpanm

RUN mkdir /tracker
WORKDIR /tracker
ADD ./mogilefsd.conf /tracker/mogilefsd.conf
ADD ./run.sh /tracker/run.sh

CMD bash -x ./run.sh
