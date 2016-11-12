FROM tomcat:7-plos

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk add python py-mysqldb py-pip
COPY requirements.txt $HOME
RUN pip install -r $HOME/requirements.txt

HEALTHCHECK CMD curl -f http://localhost:8080/journals || exit 1

RUN mkdir -p $AMBRA_CONF $HOME/datastores/ingested $HOME/datastores/ingest && \
  cp $CATALINA_HOME/conf/* $AMBRA_CONF && \
  rm -rf $CATALINA_HOME/conf && \
  ln -s $AMBRA_CONF $CATALINA_HOME/conf

COPY run*.sh *.sql *.py dbschema $HOME
COPY rhino.war $CATALINA_HOME/webapps/ROOT.war
COPY context.xml ambra.xml $AMBRA_CONF

CMD bash $HOME/run.sh
