FROM tomcat:6-jre7

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client build-essential cpanminus && \
    cpanm install --force MogileFS::Utils

RUN rm -rf $CATALINA_HOME/webapps/ROOT

COPY . /root

COPY *.war $CATALINA_HOME/webapps/ROOT.war
COPY context.xml $CATALINA_HOME/conf/context.xml

CMD bash /root/run.sh
