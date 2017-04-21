FROM tomcat:8-jre8-alpine
# FROM plos/tomcat:7

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk update && apk add mysql-client bash curl
RUN rm -rf $CATALINA_HOME/webapps/*

ADD http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar $CATALINA_HOME/lib/
ADD http://central.maven.org/maven2/com/mchange/c3p0/0.9.5.2/c3p0-0.9.5.2.jar $CATALINA_HOME/lib/
ADD http://central.maven.org/maven2/com/mchange/mchange-commons-java/0.2.11/mchange-commons-java-0.2.11.jar $CATALINA_HOME/lib/
ADD https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip /root/

WORKDIR /root
RUN unzip consul*.zip

ENV HOME /root/

RUN mkdir -p $CATALINA_HOME/webapps/ROOT ; echo '<meta http-equiv="refresh" content="0;url=cas/login"/>' > $CATALINA_HOME/webapps/ROOT/index.html


RUN mkdir /etc/consul.d && echo '{"service": {"name": "nedcas", "port": 8080, "check": {"name":"basic request", "http": "http://localhost:8080/cas/login", "interval": "10s", "timeout":"2s"}}}' > /etc/consul.d/web.json

HEALTHCHECK --interval=2m --timeout=3s \
  CMD curl -f http://localhost:8080/cas/login || exit 1

COPY run*.sh *.sql $HOME
COPY ned-cas-*.war $CATALINA_HOME/webapps/cas.war

RUN mkdir /etc/cas
COPY log4j2.xml /etc/cas
COPY cas.properties /etc/cas

CMD bash $HOME/run.sh
