FROM tomcat:6-jre7

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client
RUN rm -rf $CATALINA_HOME/webapps/ROOT

RUN wget -P /usr/local/tomcat/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.12/mysql-connector-java-5.1.12.jar && \
  wget -P /usr/local/tomcat/lib/ http://central.maven.org/maven2/org/apache/tomcat/tomcat-jdbc/7.0.21/tomcat-jdbc-7.0.21.jar

ENV AMBRA_CONF /etc/ambra/

RUN mkdir -p $AMBRA_CONF /root/datastores/ingested /root/datastores/ingest

COPY . /root

RUN cp $CATALINA_HOME/conf/* $AMBRA_CONF && \
  rm -rf $CATALINA_HOME/conf && \
  ln -s $AMBRA_CONF $CATALINA_HOME/conf

COPY rhino.war $CATALINA_HOME/webapps/ROOT.war
COPY *.xml $AMBRA_CONF
COPY rhino.yaml $AMBRA_CONF

CMD bash /root/run.sh
