FROM tomcat:7-jre8-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

# TODO: move gcc et tools into build step instead of prod image

RUN apk update && apk add mysql-client bash curl \
  wget make gcc g++ git patch perl perl-dev && \
  curl -L https://cpanmin.us | perl - App::cpanminus && \
  cpanm install --force MogileFS::Utils

RUN rm -rf $CATALINA_HOME/webapps/*

COPY run*.sh *.mysql /root/

COPY *.war $CATALINA_HOME/webapps/ROOT.war
COPY context.xml $CATALINA_HOME/conf/context.xml

CMD bash /root/run.sh
