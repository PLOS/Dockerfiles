FROM tomcat:6-jre7

#MAINTAINER "Public Library of Science" # does not show in inspect
LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client

COPY . /root

CMD bash /root/run.sh
