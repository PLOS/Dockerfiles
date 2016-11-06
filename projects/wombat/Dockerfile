FROM tomcat:7-plos

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk add python py-pip
# TODO: replace wombat.yaml with python script from plos-themes

RUN rm -rf $CATALINA_HOME/webapps/*

ENV AMBRA_CONF /etc/ambra/

RUN mkdir $AMBRA_CONF && \
  cp $CATALINA_HOME/conf/* $AMBRA_CONF && \
  rm -rf $CATALINA_HOME/conf && \
  ln -s $AMBRA_CONF $CATALINA_HOME/conf

COPY run*.sh /root/
COPY wombat.yaml $AMBRA_CONF
COPY wombat-*.war $CATALINA_HOME/webapps/ROOT.war

CMD bash /root/run.sh
