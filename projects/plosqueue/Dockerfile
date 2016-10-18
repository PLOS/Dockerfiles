FROM openjdk:8-jre-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk update && apk add mysql-client bash

WORKDIR /root

ENV AMBRA_CONF /etc/ambra/

RUN mkdir $AMBRA_CONF

COPY run*.sh bin /root/
ADD *.tar.gz /root/
RUN mv /root/plos-queue-* /root/plos-queue
COPY camel.properties $AMBRA_CONF

CMD bash /root/run.sh
