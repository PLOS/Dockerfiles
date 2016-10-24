#!/usr/bin/env bash

$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../build-helpers.sh \
  build_java_service_images ned-cas nedcas
