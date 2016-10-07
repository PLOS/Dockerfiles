FROM php:5-alpine
# FROM php:5-apache

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk update && apk add mysql-client bash

WORKDIR /root

COPY *.sh *.sql /root/

CMD bash /root/run.sh
