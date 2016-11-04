#!/usr/bin/env bash

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../build-helpers.sh

# eventually I would like to use plos-themes/build_config_rhino.py
# but
# 1. It should use pyyaml instead of build_config_utils.py
# 2. I cant set the NED username, since its hard coded
# 3. It crosses projects so I have to do a build time hack
#
# # HACK: copy python scripts over from ploth-themes
# cp $(get_local_src_dir plos-themes)/{requirements.txt,build_config_rhino.py,build_config_utils.py} "$( dirname "${BASH_SOURCE[0]}" )"

build_java_service_images rhino rhino
