FROM tomcat:6-jre7

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client

RUN wget -P $CATALINA_HOME/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar && \
  wget -P  $CATALINA_HOME/lib/ http://central.maven.org/maven2/org/apache/tomcat/tomcat-jdbc/8.0.23/tomcat-jdbc-8.0.23.jar && \
  wget -O $CATALINA_HOME/lib/slf4j-log4j12-1.6.1.jar \
  https://search.maven.org/remotecontent?filepath=org/slf4j/slf4j-log4j12/1.6.1/slf4j-log4j12-1.6.1.jar && \
  wget -O $CATALINA_HOME/lib/slf4j-api-1.6.1.jar \
    https://search.maven.org/remotecontent?filepath=org/slf4j/slf4j-api/1.6.1/slf4j-api-1.6.1.jar && \
  wget -O $CATALINA_HOME/lib/log4j-1.2.17.jar \
    https://search.maven.org/remotecontent?filepath=log4j/log4j/1.2.17/log4j-1.2.17.jar && \
  wget -O  $CATALINA_HOME/lib/jcl-over-slf4j-1.6.1.jar \
    https://search.maven.org/remotecontent?filepath=org/slf4j/jcl-over-slf4j/1.6.1/jcl-over-slf4j-1.6.1.jar

RUN mkdir /etc/ambra

COPY . /root

CMD bash /root/run.sh
