FROM tomcat:7-jre8-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ENV HOME /root/

# TODO: move gcc and tools into build step instead of prod image somehow

RUN apk update && apk add mysql-client bash curl \
  wget make gcc g++ git patch perl perl-dev && \
  curl -L https://cpanmin.us | perl - App::cpanminus && \
  cpanm install --force MogileFS::Utils

HEALTHCHECK CMD curl -f http://localhost:8080/config || exit 1

RUN rm -rf $CATALINA_HOME/webapps/*

COPY run*.sh *.mysql $HOME

COPY *.war $CATALINA_HOME/webapps/ROOT.war
COPY context.xml $CATALINA_HOME/conf/context.xml

CMD bash $HOME/run.sh
