FROM tomcat:6-jre8

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client
RUN rm -rf $CATALINA_HOME/webapps/ROOT

COPY . /root

COPY named-entity-service-*.war $CATALINA_HOME/webapps/ROOT.war
COPY context.xml $CATALINA_HOME/conf/

CMD bash /root/run.sh
