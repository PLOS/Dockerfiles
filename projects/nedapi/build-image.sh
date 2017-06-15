#!/usr/bin/env bash

# source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../envoy-config.sh
#   build_image_maven named-entity.service nedapi

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../envoy-config.sh

build_image tomcat

bash $ENVOY/builders/maven.sh named-entity.service nedapi
