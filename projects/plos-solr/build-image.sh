#!/bin/bash

$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../build-helpers.sh \
  build_java_service_images maven:3.3-jdk-7 solr solr