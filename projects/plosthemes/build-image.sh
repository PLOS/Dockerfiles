#!/usr/bin/env bash

# TODO: pull down and overwrite:
# code/general/Plos/ftl/common/userMgmtBaseUrl.ftl:<#assign userMgmtBaseUrl = '${AKITA_URL}'/>

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../envoy-config.sh
  build_image_non_compiled plos-themes plosthemes
