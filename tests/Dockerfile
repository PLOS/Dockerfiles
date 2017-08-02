FROM testrunner:envoy

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

# install what common libraries our tests need to run

RUN apk --no-cache add py-mysqldb && \
    pip install requests retry pytest singledispatch

# TODO: import test_helper.py somewhere?
