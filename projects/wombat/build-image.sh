#!/usr/bin/env bash

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../envoy-config.sh

# # HACK: copy python scripts over from ploth-themes
# check_local_src plos-themes
#
# cp $(get_local_src_dir plos-themes)/{requirements.txt,config/build_config_utils.py,config/build_config_wombat.py} "$( dirname "${BASH_SOURCE[0]}" )" || die "cant find config generator"

# build_image_maven wombat wombat

# NOTE: we use a debian instead of alpine image because of the way maven was configured to handle its nodejs dependency

build_image_compiled \
    wombat wombat \
    maven:3-jdk-8 maven_local_repo /root/.m2

# # hack cleanup
# rm "$( dirname "${BASH_SOURCE[0]}" )"/{requirements.txt,build_config_utils.py,build_config_wombat.py}
