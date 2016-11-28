#!/usr/bin/env bash

$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../build-helpers.sh \
  build_image_maven counter counter

# php:5-alpine
