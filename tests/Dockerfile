FROM testrunner:envoy

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

# install what common libraries our tests need to run
ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /bin/jq
RUN chmod +x /bin/jq

RUN apk --no-cache add py-mysqldb
RUN pip install requests retry pytest proboscis

# TODO: import test_helper.py somewhere?
