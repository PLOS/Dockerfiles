#!/usr/bin/env bash

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../envoy-config.sh
  build_image_maven counter counter

# php:5-alpine
