FROM tomcat:6-jre7

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client
RUN rm -rf $CATALINA_HOME/webapps/*

RUN wget -P /usr/local/tomcat/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar

COPY run*.sh /root/

COPY ned-cas-*.war $CATALINA_HOME/webapps/cas.war
COPY context.xml $CATALINA_HOME/conf/context.xml

CMD bash /root/run.sh
