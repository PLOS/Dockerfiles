#!/usr/bin/env bash

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../build-helpers.sh

# HACK: copy python scripts over from ploth-themes
check_local_git plos-themes

cp $(get_local_src_dir plos-themes)/{requirements.txt,build_config_utils.py,build_config_wombat.py} "$( dirname "${BASH_SOURCE[0]}" )" || die "cant find config generator"

build_java_service_images wombat wombat

# hack cleanup
rm "$( dirname "${BASH_SOURCE[0]}" )"/{requirements.txt,build_config_utils.py,build_config_wombat.py}
