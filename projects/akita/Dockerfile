FROM ruby:2.2-slim

# install system dependencies

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get install -y libsqlite3-dev libssl-dev
RUN apt-get install -y cpio rsync curl git

RUN gem install bundler

RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y nginx

# build assets

RUN mkdir /src
WORKDIR /src

# pre-bundle, as an optimization
ADD Gemfile /src/
ADD Gemfile.lock /src/
RUN bundle install

ADD . /src

RUN du -h -d 1

RUN bin/setup

WORKDIR /src/frontend
RUN ./node_modules/.bin/ember build --environment=development

RUN echo `ruby -rjson -e 'puts JSON.parse(File.read("package.json"))["version"]'` > /root/version.txt


# setup application

RUN mkdir /var/log/akita
RUN chmod 777 /var/log/akita

RUN mv /src/docker/akita-nginx.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/akita-nginx.conf /etc/nginx/conf.d/akita-nginx.conf
RUN rm -f /etc/nginx/sites-enabled/default


# cleanup

RUN apt-get remove -y build-essential git libpq-dev
RUN apt-get autoremove -y
RUN mv /src/frontend/dist /src/ember
RUN rm -rf /src/frontend
RUN du -sh /src

CMD ["bash", "/src/docker/docker-run.sh"]
