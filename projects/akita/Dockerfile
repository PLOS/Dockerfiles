FROM ruby:2.2-slim

LABEL vendor="Public Library of Science"

# install system dependencies

RUN apt-get update -qq && \
    apt-get install -y build-essential \
            libpq-dev libsqlite3-dev libssl-dev curl git \
            nginx && \
    curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
    apt-get install -y nodejs && \
    gem install bundler

# build assets

RUN mkdir /src
WORKDIR /src

# pre-bundle, as an optimization
ADD Gemfile /src/
ADD Gemfile.lock /src/
RUN bundle install

ADD . /src

RUN echo `ruby -rjson -e 'puts JSON.parse(File.read("/src/frontend/package.json"))["version"]'` > /root/version.txt

RUN bin/setup

WORKDIR /src/frontend
RUN ./node_modules/.bin/ember build --environment=development


# setup application

RUN mkdir /var/log/akita && chmod 777 /var/log/akita && \
		mv /src/docker/akita-nginx.conf /etc/nginx/sites-available/ && \
		ln -s /etc/nginx/sites-available/akita-nginx.conf /etc/nginx/conf.d/akita-nginx.conf && \
		rm -f /etc/nginx/sites-enabled/default

# cleanup (does not recude image size, but does reduce attack service)

RUN apt-get remove -y build-essential git libpq-dev && apt-get autoremove -y && \
		mv /src/frontend/dist /src/ember && \
		rm -rf /src/frontend

# CMD bash /root/run.sh
