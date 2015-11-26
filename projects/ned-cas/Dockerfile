FROM tomcat:6-jre8

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client
RUN rm -rf $CATALINA_HOME/webapps/*

ADD http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar $CATALINA_HOME/lib/

COPY run*.sh /root/

COPY ned-cas-*.war $CATALINA_HOME/webapps/cas.war
COPY context.xml $CATALINA_HOME/conf/context.xml
COPY server-ssl.xml $CATALINA_HOME/conf/server.xml

WORKDIR /root

RUN keytool -genkey -alias tomcat -keyalg RSA -noprompt -dname "CN=cas-local, C=US, ST=CA, L=SanFran, O=plos" -keystore cas.jks -storepass changeit -keypass changeit

CMD bash /root/run.sh
