FROM python:3.4-alpine

RUN apk --no-cache add bash curl db-dev openssl py-cffi py-libxslt && mkdir /app

WORKDIR /app

COPY requirements.txt /app/

RUN apk --no-cache add --virtual .build-deps libffi-dev py-cryptography openssl-dev build-base py-lxml libxslt-dev gcc && \
  pip install -r requirements.txt && \
  apk del .build-deps

COPY . /app
