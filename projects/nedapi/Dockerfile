FROM plos/tomcat:7

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ENV HOME /root/

RUN mkdir -p $CATALINA_HOME/webapps/ROOT ; echo '<meta http-equiv="refresh" content="0;url=v1/docs/"/>' > $CATALINA_HOME/webapps/ROOT/index.html

RUN mkdir /etc/consul.d && echo '{"service": {"name": "ned", "port": 8080, "check": {"name":"basic request", "http": "http://localhost:8080/v1/service/config", "interval": "10s", "timeout":"2s"}}}' > /etc/consul.d/web.json
# TODO: create a consul test that goes though API to get a value from the DB

HEALTHCHECK --interval=2m --timeout=3s \
  CMD curl -f http://localhost:8080/v1/service/config || exit 1

COPY run*.sh $HOME
COPY migrations $HOME/migrations
COPY named-entity-service-*.war $CATALINA_HOME/webapps/v1.war
COPY context.xml $CATALINA_HOME/conf/

CMD bash $HOME/run.sh
