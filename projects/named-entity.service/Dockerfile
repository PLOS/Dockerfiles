FROM tomcat:6-jre8

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client # xmlstarlet
RUN rm -rf $CATALINA_HOME/webapps/*

ADD https://bintray.com/artifact/download/business/maven/flyway-commandline-3.2.1-linux-x64.tar.gz /root/

WORKDIR /root
RUN tar xvfz flyway-commandline-*.tar.gz

COPY run*.sh *.sql migrations/ /root/

COPY named-entity-service-*.war $CATALINA_HOME/webapps/v0.war
COPY context.xml $CATALINA_HOME/conf/
COPY server-ssl.xml $CATALINA_HOME/conf/server.xml

RUN keytool -genkey -alias tomcat -keyalg RSA -noprompt -dname "CN=cas-local, C=US, ST=CA, L=SanFran, O=plos" -keystore web.jks -storepass changeit -keypass changeit

CMD bash /root/run.sh
