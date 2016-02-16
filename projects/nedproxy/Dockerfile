FROM nginx

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

RUN apt-get update && apt-get install -y --no-install-recommends unzip \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip /root/

WORKDIR /root
COPY run*.sh /root/

RUN unzip consul*.zip

RUN mkdir /etc/consul.d && echo '{"service": {"name": "ned", "port": 8080}}' > /etc/consul.d/web.json

CMD bash /root/run.sh
