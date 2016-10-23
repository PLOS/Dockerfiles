#!/usr/bin/env bash

$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../build-helpers.sh \
  build_java_service_images maven:3.3-jdk-8 plos-solr solr

# TODO: can this be compiled with jdk-8 ?, then we can stop using 7
