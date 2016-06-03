FROM tomcat:6-jre8

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y --no-install-recommends mysql-client-5.5 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD https://bintray.com/artifact/download/business/maven/flyway-commandline-3.2.1-linux-x64.tar.gz /root/
ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip /root/

WORKDIR /root
RUN tar xfz flyway-commandline-*.tar.gz
RUN unzip consul*.zip

RUN mkdir /etc/consul.d && echo '{"service": {"name": "ned", "port": 8080, "check": {"name":"basic request", "http": "http://localhost:8080/v1/service/config", "interval": "10s", "timeout":"2s"}}}' > /etc/consul.d/web.json
# TODO: insert a test that goes though API to get a value from the DB

RUN rm -rf "$CATALINA_HOME/webapps/*"

RUN mkdir $CATALINA_HOME/webapps/ROOT ; echo '<meta http-equiv="refresh" content="0;url=v1"/>' > $CATALINA_HOME/webapps/ROOT/index.html

COPY run*.sh *.sql migrations/ /root/

COPY named-entity-service-*.war $CATALINA_HOME/webapps/v1.war
COPY context.xml $CATALINA_HOME/conf/
# COPY server-ssl.xml $CATALINA_HOME/conf/server.xml

# RUN keytool -genkey -alias tomcat -keyalg RSA -noprompt -dname "CN=cas-local, C=US, ST=CA, L=SanFran, O=plos" -keystore web.jks -storepass changeit -keypass changeit

CMD bash /root/run.sh
