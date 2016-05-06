FROM ruby:2.2-slim

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

# install system dependencies

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential \
            libpq-dev libmysqlclient-dev libssl-dev curl git \
            mysql-client nginx passenger && \
    curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
    apt-get install -y nodejs && \
    gem install bundler && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /src
WORKDIR /src

# pre-bundle, as an optimization
COPY Gemfile /src/
COPY Gemfile.lock /src/
RUN bundle install

COPY . /src

# RUN echo $(git rev-parse HEAD|cut -c -8) > /root/version.txt
# RUN echo 'current' > /root/version.txt
RUN echo "require './config/initializers/version.rb'; puts Lagotto::VERSION" | ruby
 > /root/version.txt

# only run the setup if the dependencies are missing
# RUN ls frontend/node_modules || npm install

# RUN apt-get remove -y build-essential git libpq-dev && apt-get autoremove -y && \
# 		rm -rf /src/frontend

# CMD bash /root/run.sh
