FROM tomcat:7-plos

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN mkdir /etc/consul.d && echo '{"service": {"name": "ned", "port": 8080, "check": {"name":"basic request", "http": "http://localhost:8080/v1/service/config", "interval": "10s", "timeout":"2s"}}}' > /etc/consul.d/web.json
# TODO: create a consul test that goes though API to get a value from the DB

RUN mkdir -p $CATALINA_HOME/webapps/ROOT ; echo '<meta http-equiv="refresh" content="0;url=v1/docs/"/>' > $CATALINA_HOME/webapps/ROOT/index.html

COPY run*.sh /root/
COPY migrations /root/migrations

COPY named-entity-service-*.war $CATALINA_HOME/webapps/v1.war
COPY context.xml $CATALINA_HOME/conf/

CMD bash /root/run.sh
