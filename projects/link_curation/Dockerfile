FROM ruby:2.0-slim

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

# install system dependencies

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential \
            libpq-dev libmysqlclient-dev libssl-dev curl git \
            mysql-client-5.5 nginx && \
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

RUN echo current > /root/version.txt

# setup application

RUN mkdir /var/log/app /etc/nginx/ssl && chmod 777 /var/log/app && \
		rm -f /etc/nginx/sites-enabled/default

# cleanup (does not reduce image size, but does reduce attack service)

# RUN apt-get remove -y build-essential git libpq-dev && apt-get autoremove -y && \
# 		rm -rf /src/frontend

# CMD bash /root/run.sh
