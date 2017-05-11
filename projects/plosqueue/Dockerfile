FROM openjdk:8-jre-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk update && apk add mysql-client bash

ENV HOME /root/
ENV AMBRA_CONF /etc/ambra/
WORKDIR /root

RUN mkdir $AMBRA_CONF

# COPY run*.sh bin $HOME
COPY run*.sh $HOME
COPY camel.properties $AMBRA_CONF

ADD *.tar.gz $HOME
RUN mv $HOME/plos-queue-* $HOME/plos-queue && chmod +x runcamel.sh

CMD bash $HOME/run.sh
