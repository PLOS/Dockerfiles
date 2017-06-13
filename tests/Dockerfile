FROM testrunner:envoy

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

# install what common libraries our tests need to run
ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /bin/jq
RUN chmod +x /bin/jq

RUN pip install requests unittest proboscis
