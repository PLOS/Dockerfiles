FROM plos/tomcat:7

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ENV HOME /root/

# TODO: reduce perl footprint perhaps? install with no tests?

HEALTHCHECK CMD curl -f http://localhost:8080/config || exit 1

RUN apk --no-cache add wget perl && \
  apk --no-cache add --virtual .build-deps make gcc g++ git patch perl-dev && \
  curl -L https://cpanmin.us | perl - App::cpanminus && \
  cpanm install --force MogileFS::Utils && \
  apk del .build-deps

COPY run*.sh *.mysql $HOME

COPY *.war $CATALINA_HOME/webapps/ROOT.war
COPY context.xml $CATALINA_HOME/conf/context.xml

CMD bash $HOME/run.sh
