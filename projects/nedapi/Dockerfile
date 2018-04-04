FROM plos/tomcat:7

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ENV HOME /root/

RUN mkdir -p $CATALINA_HOME/webapps/ROOT ; echo '<meta http-equiv="refresh" content="0;url=v1/docs/"/>' > $CATALINA_HOME/webapps/ROOT/index.html

HEALTHCHECK --interval=10s \
  CMD curl -f http://localhost:8080/v1/service/config || exit 1

COPY run*.sh $HOME
COPY migrations $HOME/migrations
COPY named-entity-service-*.war $CATALINA_HOME/webapps/v1.war
COPY context.xml $CATALINA_HOME/conf/

# TODO: use context file from src/deb instead

CMD bash $HOME/run.sh
