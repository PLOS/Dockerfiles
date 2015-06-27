FROM tomcat:6-jre7

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client

# TODO: pull this out of build cache insread of WGET
RUN wget -P /usr/local/tomcat/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar

COPY . /root

CMD bash /root/run.sh
