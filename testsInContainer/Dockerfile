FROM alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk update && apk add curl bash docker python py-pip && \
    pip install 'docker-compose==1.8.0'

ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /bin/jq
RUN chmod +x /bin/jq

# ADD https://github.com/sstephenson/bats/archive/v0.4.0.tar.gz /root
# RUN cd /root && tar -xzf *.tar.gz && cd bats-* && ./install.sh /usr/local
