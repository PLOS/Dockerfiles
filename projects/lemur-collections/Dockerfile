FROM ruby:2.0-slim

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

# install system dependencies

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential \
            libpq-dev libsqlite3-dev libssl-dev curl git \
            postgresql-client nginx && \
    curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
    apt-get install -y nodejs && \
    gem install bundler && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# build assets

RUN mkdir /src
WORKDIR /src

# pre-bundle, as an optimization
COPY Gemfile /src/
COPY Gemfile.lock /src/
RUN bundle install

COPY . /src

# TODO: fetch this from a file if there is one?
RUN echo 'current' > /root/version.txt

# only run the setup if the dependencies are missing
RUN ls frontend/node_modules || bin/setup

WORKDIR /src/frontend
RUN ./node_modules/.bin/ember build --environment=production && mv /src/frontend/dist /src/ember
# TODO: make the ember environment configurable or change to prod

# setup application

RUN mkdir /var/log/akita /etc/nginx/ssl && chmod 777 /var/log/akita && \
		rm -f /etc/nginx/sites-enabled/default

# generate self signed keys if needed for testing

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=US/ST=California/L=SanFran/O=Here/CN=plos" \
    -keyout /root/nginx.key -out /root/nginx.crt

# cleanup (does not reduce image size, but does reduce attack service)

# RUN apt-get remove -y build-essential git libpq-dev && apt-get autoremove -y && \
# 		rm -rf /src/frontend

# CMD bash /root/run.sh
