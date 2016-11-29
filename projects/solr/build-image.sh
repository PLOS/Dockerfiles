#!/usr/bin/env bash

# source $FLATRACK/build-helpers.sh || source "$( dirname "${BASH_SOURCE[0]}" )"/../../flatrack/build-helpers.sh
#   build_image_maven plos-solr solr

# source "$( dirname "${BASH_SOURCE[0]}" )"/../flatrack.sh
  # build_image_maven plos-solr solr


# TODO: pass in $FLATRACK dir path as an env perhaps?

# $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../flatrack/build-helpers.sh \
#   build_image_maven plos-solr solr

source $FLATRACK/build-helpers.sh || source "$( dirname "${BASH_SOURCE[0]}" )"/../../flatrack/build-helpers.sh

build_image_maven plos-solr solr
