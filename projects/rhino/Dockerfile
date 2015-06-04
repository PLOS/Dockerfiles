FROM tomcat:6-jre7

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client

RUN wget -P /usr/local/tomcat/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar

RUN wget -P /usr/local/tomcat/lib/ http://central.maven.org/maven2/org/apache/tomcat/tomcat-jdbc/8.0.23/tomcat-jdbc-8.0.23.jar

RUN mkdir /etc/ambra
