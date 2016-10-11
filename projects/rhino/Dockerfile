# FROM tomcat:6-jre8
FROM tomcat:7-jre8-alpine

LABEL vendor="Public Library of Science"

# RUN apt-get update && apt-get install -y mysql-client python python-mysqldb
RUN apk update && apk add mysql-client python py-mysqldb bash curl
RUN rm -rf $CATALINA_HOME/webapps/*

RUN wget -P $CATALINA_HOME/lib/ http://central.maven.org/maven2/org/apache/tomcat/tomcat-jdbc/7.0.21/tomcat-jdbc-7.0.21.jar && \
  wget -P $CATALINA_HOME/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.12/mysql-connector-java-5.1.12.jar

ENV AMBRA_CONF /etc/ambra/

RUN mkdir -p $AMBRA_CONF /root/datastores/ingested /root/datastores/ingest

RUN cp $CATALINA_HOME/conf/* $AMBRA_CONF && \
  rm -rf $CATALINA_HOME/conf && \
  ln -s $AMBRA_CONF $CATALINA_HOME/conf

COPY run*.sh *.sql dbschema /root/

COPY rhino.war $CATALINA_HOME/webapps/ROOT.war
COPY rhino.yaml context.xml ambra.xml $AMBRA_CONF

CMD bash /root/run.sh
