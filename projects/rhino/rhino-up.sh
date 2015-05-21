#!/bin/bash

mkdir /tmp/ingest /tmp/ingested /tmp/autoingest

docker-compose build && docker-compose up
