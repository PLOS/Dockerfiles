#!/usr/bin/env bash



# TODO: hack, copy python scripts over from ploth-themes



$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../build-helpers.sh \
  build_java_service_images rhino rhino
