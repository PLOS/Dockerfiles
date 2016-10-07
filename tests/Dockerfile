FROM alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /bin/jq

RUN chmod +x /bin/jq

# use like so ?   curl http://couchdb.soma.plos.org:5984/_config|docker run -it testhelper /bin/jq .
