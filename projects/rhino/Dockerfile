FROM plos/tomcat:7

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk --no-cache add python py-mysqldb py-pip
# COPY requirements.txt $HOME
# RUN pip install -r $HOME/requirements.txt

HEALTHCHECK CMD curl -f http://localhost:8080/journals || exit 1

RUN mkdir -p $AMBRA_CONF $HOME/datastores/ingested $HOME/datastores/ingest && \
  cp $CATALINA_HOME/conf/* $AMBRA_CONF && \
  rm -rf $CATALINA_HOME/conf && \
  ln -s $AMBRA_CONF $CATALINA_HOME/conf

# TODO: see if we can replace the ambra_pre_migrations.sql script with this for the general case: https://plos.github.io/ambraproject/example/ambra-schema.sql
COPY run*.sh *.sql *.py dbschema $HOME
COPY rhino.war $CATALINA_HOME/webapps/ROOT.war

# TODO: replace rhino.yaml with one eventually provided in the deb package: https://developer.plos.org/jira/browse/DPRO-3411
COPY context.xml rhino.yaml $AMBRA_CONF

CMD bash $HOME/run.sh
