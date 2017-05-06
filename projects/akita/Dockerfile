FROM ruby:2.2-slim
# TODO: replace with ruby:2.2-alpine (its 150MB smaller)

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ENV HOME /root/

WORKDIR /root

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential \
            libpq-dev libsqlite3-dev libssl-dev curl git \
            nginx unzip wget && \
    gem install bundler && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    wget -O consul.zip https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip && unzip consul.zip

RUN mkdir /etc/consul.d && echo '{"service": {"name": "akita", "port": 80, "check": {"name":"basic request", "http": "http://localhost/flanders/status", "interval": "10s", "timeout":"2s"}}}' > /etc/consul.d/web.json

HEALTHCHECK --interval=2m --timeout=3s \
  CMD curl -f http://localhost/flanders/status || exit 1

# build assets
RUN mkdir /src
WORKDIR /src

# pre-bundle, as an optimization
COPY rails/Gemfile /src/
COPY rails/Gemfile.lock /src/
RUN bundle install

COPY rails /src
COPY ember /src/ember

COPY nginx.conf $HOME
COPY puma.rb $HOME
COPY run.sh $HOME

# setup application
RUN mkdir /var/log/akita /etc/nginx/ssl && chmod 777 /var/log/akita && \
		rm -f /etc/nginx/sites-enabled/default

CMD bash $HOME/run.sh
