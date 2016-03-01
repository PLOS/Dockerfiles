FROM tomcat:6-jre8

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y --no-install-recommends mysql-client-5.5 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN rm -rf "$CATALINA_HOME/webapps/*"

ADD https://bintray.com/artifact/download/business/maven/flyway-commandline-3.2.1-linux-x64.tar.gz /root/

ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip /root/
# ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_web_ui.zip /root/

WORKDIR /root
RUN tar xvfz flyway-commandline-*.tar.gz
RUN unzip consul*_linux*.zip
# RUN unzip consul*ui.zip -d consul_ui

RUN mkdir /etc/consul.d && echo '{"service": {"name": "ned", "port": 8080}}' > /etc/consul.d/web.json

COPY run*.sh *.sql migrations/ /root/

COPY named-entity-service-*.war $CATALINA_HOME/webapps/v1.war
COPY context.xml $CATALINA_HOME/conf/
COPY server-ssl.xml $CATALINA_HOME/conf/server.xml

RUN keytool -genkey -alias tomcat -keyalg RSA -noprompt -dname "CN=cas-local, C=US, ST=CA, L=SanFran, O=plos" -keystore web.jks -storepass changeit -keypass changeit

CMD bash /root/run.sh
