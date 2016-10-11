FROM alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk update && apk add curl bash

ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /bin/jq

RUN chmod +x /bin/jq

# COPY test-helpers.sh /root
