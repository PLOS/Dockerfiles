FROM openjdk:8-jre-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk update && apk add mysql-client bash

WORKDIR /root

COPY *.* /root/

CMD bash /root/run.sh
