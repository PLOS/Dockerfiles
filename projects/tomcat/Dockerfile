FROM tomcat:7-jre8-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ENV AMBRA_CONF /etc/ambra/

# small hack since COPY does not recognize environment vars from the shell
ENV HOME /root/

# install mysql client, jdbc connectors, flyway, and consul
RUN apk update && apk add bash curl openssl mysql-client && \
  wget -P $CATALINA_HOME/lib/ http://central.maven.org/maven2/org/apache/tomcat/tomcat-jdbc/7.0.21/tomcat-jdbc-7.0.21.jar && \
  wget -P $CATALINA_HOME/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.12/mysql-connector-java-5.1.12.jar && \
  wget -O - https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/4.0.3/flyway-commandline-4.0.3.tar.gz | tar xz -C /root && \
  wget -P /tmp https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip && unzip /tmp/consul*.zip -d /root && \
  rm -rf /tmp/consul*.zip && \
  find /root/flyway-*/drivers ! -name 'mariadb*' -type f -exec rm -f {} +

COPY start_tomcat.sh $CATALINA_HOME/bin/

# remove stock tomcat app
RUN rm -rf $CATALINA_HOME/webapps/* && \
  chmod +x $CATALINA_HOME/bin/start_tomcat.sh
