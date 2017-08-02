FROM testrunner:envoy

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

# install what common libraries our tests need to run

RUN pip3 install requests retry pytest PyMySQL singledispatch

# TODO: import test_helper.py somewhere?
