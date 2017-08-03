FROM openjdk:8-jre-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ENV AMBRA_CONF /etc/ambra/

RUN apk --no-cache add mysql-client bash

ENV HOME /root/
ENV AMBRA_CONF /opt/plos/plos-queue/conf
WORKDIR /root

RUN mkdir -p $AMBRA_CONF

COPY run*.sh $HOME
COPY camel.properties camel-log4j.properties ambra.xml /etc/ambra/

ADD *.tar.gz $HOME
RUN mv $HOME/plos-queue-* $HOME/plos-queue && chmod +x runcamel.sh

CMD bash $HOME/run.sh
