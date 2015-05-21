FROM tomcat:6-jre7

RUN apt-get update && apt-get install -y mysql-client

RUN mkdir /etc/ambra

ADD * /root/

# ADD docker_runscript.bash /root/docker_runscript.bash

CMD ["bash", "/root/docker_runscript.bash"]
