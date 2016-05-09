FROM phusion/passenger-customizable

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ENV SRC /home/app/lagotto

RUN /pd_build/ruby2.2.sh
RUN /pd_build/nodejs.sh

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends curl mysql-client

RUN gem install bundler

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Enable Nginx, Redis, Memcached
RUN rm -f /etc/service/nginx/down /etc/service/redis/down /etc/service/memcached/down && \
    rm /etc/nginx/sites-enabled/default

RUN mkdir $SRC
RUN chown -R app:app $SRC && chmod -R 755 $SRC
WORKDIR $SRC

COPY Gemfile $SRC
COPY Gemfile.lock $SRC
RUN sudo -u app bundle install --path vendor/bundle

COPY . $SRC

RUN chown -R app:app $SRC && chmod -R 755 $SRC

# Make folders that hold data available as volumes
# VOLUME ["$SRC/tmp", "$SRC/log", "$SRC/data"]

RUN echo "require './config/initializers/version.rb'; puts Lagotto::VERSION" | ruby > /root/version.txt

# RUN ls frontend/node_modules || npm install
