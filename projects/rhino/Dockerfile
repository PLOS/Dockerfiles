FROM tomcat:7-plos

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apk add python py-mysqldb

# RUN apk add py-pip
# COPY requirements.txt /root
# RUN pip install -r /root/requirements.txt

ENV AMBRA_CONF /etc/ambra/

RUN mkdir -p $AMBRA_CONF /root/datastores/ingested /root/datastores/ingest

RUN cp $CATALINA_HOME/conf/* $AMBRA_CONF && \
  rm -rf $CATALINA_HOME/conf && \
  ln -s $AMBRA_CONF $CATALINA_HOME/conf

COPY run*.sh *.sql *.py dbschema /root/
COPY rhino.war $CATALINA_HOME/webapps/ROOT.war
COPY rhino.yaml context.xml ambra.xml $AMBRA_CONF

CMD bash /root/run.sh
