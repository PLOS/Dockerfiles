FROM tomcat:6-jre8

LABEL vendor="Public Library of Science"

RUN rm -rf $CATALINA_HOME/webapps/*

ENV AMBRA_CONF /etc/ambra/

RUN mkdir $AMBRA_CONF

RUN cp $CATALINA_HOME/conf/* $AMBRA_CONF && \
  rm -rf $CATALINA_HOME/conf && \
  ln -s $AMBRA_CONF $CATALINA_HOME/conf

COPY run*.sh /root/

COPY wombat.yaml $AMBRA_CONF
COPY wombat-*.war $CATALINA_HOME/webapps/ROOT.war

CMD bash /root/run.sh
