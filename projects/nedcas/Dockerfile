FROM plos/tomcat:8

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

# ENV HOME /root/

RUN mkdir -p $CATALINA_HOME/webapps/ROOT ; echo '<meta http-equiv="refresh" content="0;url=cas/login"/>' > $CATALINA_HOME/webapps/ROOT/index.html

HEALTHCHECK --interval=10s \
  CMD curl -f http://localhost:8080/cas/login || exit 1

COPY run*.sh *.sql $HOME
COPY *.war $CATALINA_HOME/webapps/cas.war

# TODO: fetch cas.properties from <src>/setup/ so it does not get out of sync
COPY cas.properties $CATALINA_HOME/conf/
COPY log4j2.xml $CATALINA_HOME/conf/
COPY migrations $HOME/migrations

RUN mkdir /etc/cas && ln -s $CATALINA_HOME/conf /etc/cas/config

CMD bash $HOME/run.sh
