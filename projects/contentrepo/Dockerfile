FROM tomcat:6-jre8
# FROM tomcat:7-jre8-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

# RUN apk update && apk add mysql-client bash curl

RUN apt-get update && apt-get install -y mysql-client \
    build-essential cpanminus && \
    cpanm install --force MogileFS::Utils

RUN rm -rf $CATALINA_HOME/webapps/*

COPY run*.sh *.mysql /root/

COPY *.war $CATALINA_HOME/webapps/ROOT.war
COPY context.xml $CATALINA_HOME/conf/context.xml

CMD bash /root/run.sh
