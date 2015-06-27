FROM tomcat:6-jre7

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client

COPY . /root

CMD bash /root/run.sh
