#!/usr/bin/env bash

# set -x

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../build-helpers.sh

# HACK: copy python scripts over from plos-themes
cp $(get_local_src_dir plos-themes)/{requirements.txt,build_config_utils.py,build_config_rhino.py} "$( dirname "${BASH_SOURCE[0]}" )"
# TODO: checksum validate build_config_rhino.py

build_java_service_images rhino rhino

# hack cleanup
rm "$( dirname "${BASH_SOURCE[0]}" )"/{requirements.txt,build_config_utils.py,build_config_rhino.py}
