FROM tomcat:7-jre8-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk update && apk add mysql-client openssl curl bash && \
  wget -P $CATALINA_HOME/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.12/mysql-connector-java-5.1.12.jar && \
  wget -O consul.zip https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip && unzip consul.zip

RUN mkdir /etc/consul.d && echo '{"service": {"name": "nedcas", "port": 8080, "check": {"name":"basic request", "http": "http://localhost:8080/cas/login", "interval": "10s", "timeout":"2s"}}}' > /etc/consul.d/web.json

RUN rm -rf $CATALINA_HOME/webapps/*

RUN mkdir $CATALINA_HOME/webapps/ROOT ; echo '<meta http-equiv="refresh" content="0;url=cas/login"/>' > $CATALINA_HOME/webapps/ROOT/index.html

COPY run*.sh *.sql /root/
COPY ned-cas-*.war $CATALINA_HOME/webapps/cas.war
COPY context.xml $CATALINA_HOME/conf/

CMD bash /root/run.sh
