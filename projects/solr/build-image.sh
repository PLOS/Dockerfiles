#!/usr/bin/env bash

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../envoy-config.sh

build_image_maven plos-solr solr
