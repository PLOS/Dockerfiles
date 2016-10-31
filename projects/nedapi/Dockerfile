FROM tomcat:7-jre8-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk update && apk add bash curl openssl mysql-client && \
  wget -P $CATALINA_HOME/lib/ http://central.maven.org/maven2/org/apache/tomcat/tomcat-jdbc/7.0.21/tomcat-jdbc-7.0.21.jar && \
  wget -P $CATALINA_HOME/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.12/mysql-connector-java-5.1.12.jar && \
  wget -O - https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/4.0.3/flyway-commandline-4.0.3.tar.gz | tar xz -C /root && \
  wget -P /tmp https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip && unzip /tmp/consul*.zip -d /root

RUN mkdir /etc/consul.d && echo '{"service": {"name": "ned", "port": 8080, "check": {"name":"basic request", "http": "http://localhost:8080/v1/service/config", "interval": "10s", "timeout":"2s"}}}' > /etc/consul.d/web.json
# TODO: create a consul test that goes though API to get a value from the DB

RUN rm -rf "$CATALINA_HOME/webapps/*"

RUN mkdir -p $CATALINA_HOME/webapps/ROOT ; echo '<meta http-equiv="refresh" content="0;url=v1/docs/"/>' > $CATALINA_HOME/webapps/ROOT/index.html

COPY run*.sh /root/
COPY migrations /root/migrations

COPY named-entity-service-*.war $CATALINA_HOME/webapps/v1.war
COPY context.xml $CATALINA_HOME/conf/

CMD bash /root/run.sh
