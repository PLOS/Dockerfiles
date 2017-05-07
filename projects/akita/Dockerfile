FROM ruby:2.2-alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

ENV HOME /root/

WORKDIR /root


# pre-bundle, as an optimization
COPY rails/Gemfile /src/
COPY rails/Gemfile.lock /src/


HEALTHCHECK --interval=2m --timeout=3s \
  CMD curl -f http://localhost/flanders/status || exit 1

# WORKDIR /src

RUN apk --update add git unzip wget curl bash nginx tzdata \
    --virtual .ruby-builddeps ruby-json build-base libxml2-dev libxslt-dev ruby-dev && \
    bundle config --global build.nokogiri "--use-system-libraries" && \
    wget -O consul.zip https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip && unzip consul.zip && \

    mkdir /etc/consul.d && \
    echo '{"service": {"name": "akita", "port": 80, "check": {"name":"basic request", "http": "http://localhost/flanders/status", "interval": "10s", "timeout":"2s"}}}' > /etc/consul.d/web.json && \

    # mkdir /src && \
    mkdir /var/log/akita /etc/nginx/ssl && \
    chmod 777 /var/log/akita && \
		rm -f /etc/nginx/sites-enabled/default && \

    echo 'gem: --no-document' >> ~/.gemrc && \
    cp ~/.gemrc /etc/gemrc && \
    chmod uog+r /etc/gemrc && \
       cd /src && bundle install && apk del ruby-json build-base libxml2-dev libxslt-dev ruby-dev
       #apk del .ruby-builddeps



# RUN bundle install && apk del .ruby-builddeps

COPY nginx-root.conf /etc/nginx/nginx.conf
COPY nginx-akita.conf /etc/nginx/conf.d/akita.conf
COPY puma.rb $HOME
COPY run.sh $HOME

COPY rails /src
COPY ember /src/ember

CMD bash $HOME/run.sh
