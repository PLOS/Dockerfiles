FROM ruby:2.2-slim
# FROM ruby:2.2-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ENV HOME /root/

WORKDIR /root

HEALTHCHECK --interval=2m --timeout=3s \
  CMD curl -f http://localhost/flanders/status || exit 1

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential \
            libpq-dev libsqlite3-dev libssl-dev curl git \
            nginx unzip wget && \
    curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
    apt-get install -y nodejs && \
    gem install bundler && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    wget -O consul.zip https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip && unzip consul.zip

RUN mkdir /etc/consul.d && echo '{"service": {"name": "akita", "port": 80, "check": {"name":"basic request", "http": "http://localhost/flanders/status", "interval": "10s", "timeout":"2s"}}}' > /etc/consul.d/web.json

# build assets
RUN mkdir /src
WORKDIR /src

# pre-bundle, as an optimization
COPY Gemfile /src/
COPY Gemfile.lock /src/
RUN bundle install

COPY . /src

RUN echo `ruby -rjson -e 'puts JSON.parse(File.read("/src/frontend/package.json"))["version"]'` > $HOME/version.txt

# only run the setup if the dependencies are missing
RUN ls frontend/node_modules || bin/setup

WORKDIR /src/frontend
RUN ./node_modules/.bin/ember build --environment=production && mv /src/frontend/dist /src/ember

# setup application
RUN mkdir /var/log/akita /etc/nginx/ssl && chmod 777 /var/log/akita && \
		rm -f /etc/nginx/sites-enabled/default

# CMD bash $HOME/run.sh
