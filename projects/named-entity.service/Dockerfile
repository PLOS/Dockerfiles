FROM tomcat:6-jre8

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client # xmlstarlet
RUN rm -rf $CATALINA_HOME/webapps/*

ADD https://bintray.com/artifact/download/business/maven/flyway-commandline-3.2.1-linux-x64.tar.gz /root/

WORKDIR /root
RUN tar xvfz flyway-commandline-*.tar.gz
MOVE flyway-* to flyway/

COPY run*.sh *.sql /root/

COPY named-entity-service-*.war $CATALINA_HOME/webapps/ROOT.war
COPY context.xml $CATALINA_HOME/conf/

RUN keytool -genkey -noprompt -alias tomcat -keyalg RSA \
  -dname "CN=plos, OU=, O=, L=SF, S=CA, C=US" \
  -storepass changeit -keypass changeit -keystore /root/keystore

CMD bash /root/run.sh
