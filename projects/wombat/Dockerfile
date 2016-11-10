FROM tomcat:7-plos

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk add python py-pip
COPY requirements.txt $HOME
RUN pip install -r $HOME/requirements.txt

HEALTHCHECK --interval=2m --timeout=3s \
  CMD curl -f http://localhost:8080/ || exit 1

RUN mkdir $AMBRA_CONF && \
  cp $CATALINA_HOME/conf/* $AMBRA_CONF && \
  rm -rf $CATALINA_HOME/conf && \
  ln -s $AMBRA_CONF $CATALINA_HOME/conf

COPY run*.sh *.py $HOME
COPY wombat-*.war $CATALINA_HOME/webapps/ROOT.war

CMD bash $HOME/run.sh
