#!/usr/bin/env bash

$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../build-helpers.sh \
  build_java_service_images maven:3.3-jdk-8 rhino rhino
