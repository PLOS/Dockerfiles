#!/usr/bin/env bash

set -x

SCRIPTDIR="$( dirname "${BASH_SOURCE[0]}")"

# source $( cd "$SCRIPTDIR" && pwd )/../build-helpers.sh

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../flatrack-config.sh

# HACK: copy python scripts over from plos-themes
check_local_src plos-themes

cp $(get_local_src_dir plos-themes)/{requirements.txt,config/build_config_utils.py,config/build_config_rhino.py} "$SCRIPTDIR" || die "cant find config generator"
# TODO: checksum validate build_config_rhino.py

build_image_maven rhino rhino

# hack cleanup
rm "$SCRIPTDIR"/{requirements.txt,build_config_utils.py,build_config_rhino.py}
