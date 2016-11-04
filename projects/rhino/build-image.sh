#!/usr/bin/env bash

set -x

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../build-helpers.sh

# HACK: copy python scripts over from ploth-themes
cp $(get_local_src_dir plos-themes)/{requirements.txt,build_config_rhino.py,build_config_utils.py} "$( dirname "${BASH_SOURCE[0]}" )"

# ../build-helpers.sh \
  build_java_service_images rhino rhino
