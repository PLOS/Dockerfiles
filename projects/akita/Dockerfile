FROM ruby:2.2-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ENV HOME /root/

WORKDIR /root

HEALTHCHECK --interval=10s \
  CMD curl -f http://localhost/flanders/status/more || exit 1

RUN apk --no-cache add git unzip wget curl bash nginx tzdata libxslt-dev && \

    bundle config --global build.nokogiri "--use-system-libraries" && \

    mkdir /var/log/akita /etc/nginx/ssl && \
    chmod 777 /var/log/akita && \
		rm -f /etc/nginx/sites-enabled/default && \

    echo 'gem: --no-document' >> ~/.gemrc && \
    cp ~/.gemrc /etc/gemrc && \
    chmod uog+r /etc/gemrc

# pre-bundle, as an optimization
COPY rails/Gemfile /src/
COPY rails/Gemfile.lock /src/

RUN apk --no-cache add --virtual .ruby-builddeps ruby-json build-base libxml2-dev ruby-dev && \
    cd /src && bundle install && \
    apk del .ruby-builddeps

COPY nginx-root.conf /etc/nginx/nginx.conf
COPY nginx-akita.conf /etc/nginx/conf.d/akita.conf
COPY puma.rb $HOME
COPY run.sh $HOME

COPY run*.sh $HOME

COPY rails /src
COPY ember /src/ember

# HACK: to deal with status controller
RUN mkdir /src/frontend
COPY package.json /src/frontend/

# expose needed for discovery by dockercloud/haproxy
EXPOSE 80

CMD bash $HOME/run.sh
