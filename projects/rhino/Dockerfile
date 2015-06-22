FROM tomcat:6-jre7

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client

RUN wget -P /usr/local/tomcat/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.12/mysql-connector-java-5.1.12.jar

RUN wget -P /usr/local/tomcat/lib/ http://central.maven.org/maven2/org/apache/tomcat/tomcat-jdbc/7.0.21/tomcat-jdbc-7.0.21.jar

RUN mkdir /etc/ambra

RUN mkdir -p /root/datastores/ingested

RUN mkdir -p /root/datastores/ingest