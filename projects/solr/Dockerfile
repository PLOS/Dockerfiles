FROM tomcat:7-jre8-alpine
# FROM plos/tomcat:7  # not doing this because of the lib bloat

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ENV AMBRA_CONF /etc/ambra/

RUN apk --no-cache add bash openssl && \
    wget -O $CATALINA_HOME/lib/slf4j-log4j12-1.6.1.jar \
      https://search.maven.org/remotecontent?filepath=org/slf4j/slf4j-log4j12/1.6.1/slf4j-log4j12-1.6.1.jar && \
    wget -O $CATALINA_HOME/lib/slf4j-api-1.6.1.jar \
      https://search.maven.org/remotecontent?filepath=org/slf4j/slf4j-api/1.6.1/slf4j-api-1.6.1.jar && \
    wget -O $CATALINA_HOME/lib/log4j-1.2.17.jar \
      https://search.maven.org/remotecontent?filepath=log4j/log4j/1.2.17/log4j-1.2.17.jar && \
    wget -O  $CATALINA_HOME/lib/jcl-over-slf4j-1.6.1.jar \
      https://search.maven.org/remotecontent?filepath=org/slf4j/jcl-over-slf4j/1.6.1/jcl-over-slf4j-1.6.1.jar

# ENV JAVA_OPTS "$JAVA_OPTS -Dsolr.solr.home=$CATALINA_HOME/solr/home"
# ENV JAVA_OPTS "$JAVA_OPTS -Dsolr.data.dir=$CATALINA_HOME/solr/home/data"

RUN mkdir -p $AMBRA_CONF $CATALINA_HOME/solr/home $CATALINA_HOME/solr/home/data

# TODO: add HEALTHCHECK

RUN cp $CATALINA_HOME/conf/* $AMBRA_CONF && \
  rm -rf $CATALINA_HOME/conf && \
  ln -s $AMBRA_CONF $CATALINA_HOME/conf

COPY run*.sh /root/
COPY log4j.xml $CATALINA_HOME/lib/
COPY solr.war $CATALINA_HOME/webapps/

WORKDIR /root

RUN unzip $CATALINA_HOME/webapps/solr.war 'collection1/*' -d $CATALINA_HOME/solr/home/

CMD bash $HOME/run.sh
