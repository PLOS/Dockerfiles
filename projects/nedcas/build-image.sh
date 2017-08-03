#!/usr/bin/env bash

# source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../envoy-config.sh
#   build_image_maven ned-cas nedcas

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../envoy-config.sh

build_image tomcat8

bash $ENVOY/builders/maven.sh ned-cas nedcas
