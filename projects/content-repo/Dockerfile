FROM tomcat:6-jre7

RUN apt-get update && apt-get install -y mysql-client

ADD docker_runscript.bash /start.sh
RUN chmod 755 /start.sh
