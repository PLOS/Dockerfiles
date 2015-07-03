FROM tomcat:6-jre7

LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y mysql-client build-essential cpanminus && \
    cpanm install --force MogileFS::Utils

COPY . /root

CMD bash /root/run.sh
