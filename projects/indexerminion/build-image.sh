#!/usr/bin/env bash

source $FLATRACK/build-helpers.sh || source "$( dirname "${BASH_SOURCE[0]}" )"/../../flatrack/build-helpers.sh
  build_image_maven indexer-minion indexerminion
