FROM tomcat:6-jre7

LABEL vendor="Public Library of Science"

ENV AMBRA_CONF /etc/ambra/

RUN mkdir $AMBRA_CONF

RUN rm -rf $CATALINA_HOME/webapps/ROOT

COPY . /root

RUN cp $CATALINA_HOME/conf/* $AMBRA_CONF && \
  rm -rf $CATALINA_HOME/conf && \
  ln -s $AMBRA_CONF $CATALINA_HOME/conf

COPY wombat.yaml $AMBRA_CONF
COPY wombat-*.war $CATALINA_HOME/webapps/ROOT.war

CMD bash /root/run.sh
