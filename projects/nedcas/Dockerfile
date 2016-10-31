FROM tomcat:7-plos

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN mkdir /etc/consul.d && echo '{"service": {"name": "nedcas", "port": 8080, "check": {"name":"basic request", "http": "http://localhost:8080/cas/login", "interval": "10s", "timeout":"2s"}}}' > /etc/consul.d/web.json

RUN mkdir -p $CATALINA_HOME/webapps/ROOT ; echo '<meta http-equiv="refresh" content="0;url=cas/login"/>' > $CATALINA_HOME/webapps/ROOT/index.html

COPY run*.sh *.sql /root/
COPY ned-cas-*.war $CATALINA_HOME/webapps/cas.war
COPY context.xml $CATALINA_HOME/conf/

CMD bash /root/run.sh
