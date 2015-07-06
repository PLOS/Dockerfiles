FROM tomcat:6-jre7

MAINTAINER Public Library of Science <BAU_Team@plos.org>
LABEL vendor="Public Library of Science"

RUN wget -O $CATALINA_HOME/lib/slf4j-log4j12-1.6.1.jar \
    https://search.maven.org/remotecontent?filepath=org/slf4j/slf4j-log4j12/1.6.1/slf4j-log4j12-1.6.1.jar && \
    wget -O $CATALINA_HOME/lib/slf4j-api-1.6.1.jar \
    https://search.maven.org/remotecontent?filepath=org/slf4j/slf4j-api/1.6.1/slf4j-api-1.6.1.jar && \
    wget -O $CATALINA_HOME/lib/log4j-1.2.17.jar \
    https://search.maven.org/remotecontent?filepath=log4j/log4j/1.2.17/log4j-1.2.17.jar && \
    wget -O  $CATALINA_HOME/lib/jcl-over-slf4j-1.6.1.jar \
    https://search.maven.org/remotecontent?filepath=org/slf4j/jcl-over-slf4j/1.6.1/jcl-over-slf4j-1.6.1.jar

ENV AMBRA_CONF /etc/ambra/
# ENV JAVA_OPTS "$JAVA_OPTS -Dsolr.solr.home=$CATALINA_HOME/solr/home"
# ENV JAVA_OPTS "$JAVA_OPTS -Dsolr.data.dir=$CATALINA_HOME/solr/home/data"

RUN mkdir -p $AMBRA_CONF $CATALINA_HOME/solr/home $CATALINA_HOME/solr/home/data

RUN cp $CATALINA_HOME/conf/* $AMBRA_CONF && \
  rm -rf $CATALINA_HOME/conf && \
  ln -s $AMBRA_CONF $CATALINA_HOME/conf

# EXPOSE 8080

COPY . /root

COPY log4j.xml $CATALINA_HOME/lib/
COPY solr.war $CATALINA_HOME/webapps/

WORKDIR /root

RUN unzip -q solr.war -d temp/ && \
  cp -r temp/collection1 $CATALINA_HOME/solr/home/ && \
  rm -rf temp/

CMD bash /root/run.sh
