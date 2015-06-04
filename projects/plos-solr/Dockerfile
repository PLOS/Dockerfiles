FROM tomcat:6-jre7
MAINTAINER Public Library of Science <BAU_Team@plos.org>

RUN mkdir /etc/ambra
RUN mkdir -p $CATALINA_HOME/solr/home
RUN mkdir -p $CATALINA_HOME/solr/home/data

RUN wget -O $CATALINA_HOME/lib/slf4j-log4j12-1.6.1.jar \
   https://search.maven.org/remotecontent?filepath=org/slf4j/slf4j-log4j12/1.6.1/slf4j-log4j12-1.6.1.jar

RUN wget -O $CATALINA_HOME/lib/slf4j-api-1.6.1.jar \
    https://search.maven.org/remotecontent?filepath=org/slf4j/slf4j-api/1.6.1/slf4j-api-1.6.1.jar

RUN wget -O $CATALINA_HOME/lib/log4j-1.2.17.jar \
    https://search.maven.org/remotecontent?filepath=log4j/log4j/1.2.17/log4j-1.2.17.jar

RUN wget -O  $CATALINA_HOME/lib/jcl-over-slf4j-1.6.1.jar \
    https://search.maven.org/remotecontent?filepath=org/slf4j/jcl-over-slf4j/1.6.1/jcl-over-slf4j-1.6.1.jar

EXPOSE 8080