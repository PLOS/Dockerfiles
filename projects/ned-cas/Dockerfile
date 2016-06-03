FROM tomcat:7-jre8

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y --no-install-recommends mysql-client-5.5 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN rm -rf $CATALINA_HOME/webapps/*

ADD http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar $CATALINA_HOME/lib/

COPY run*.sh /root/
COPY *.sql /root/

RUN mkdir $CATALINA_HOME/webapps/ROOT ; echo '<meta http-equiv="refresh" content="0;url=cas/login"/>' > $CATALINA_HOME/webapps/ROOT/index.html

COPY ned-cas-*.war $CATALINA_HOME/webapps/cas.war
COPY context.xml $CATALINA_HOME/conf/
COPY server-ssl.xml $CATALINA_HOME/conf/server.xml

WORKDIR /root

RUN keytool -genkey -alias tomcat -keyalg RSA -noprompt -dname "CN=cas-local, C=US, ST=CA, L=SanFran, O=plos" -keystore web.jks -storepass changeit -keypass changeit

CMD bash /root/run.sh
