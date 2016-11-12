#!/usr/bin/env bash

# TODO: pull down and overwrite:
# code/general/Plos/ftl/common/userMgmtBaseUrl.ftl:<#assign userMgmtBaseUrl = '${AKITA_URL}'/>

$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../build-helpers.sh \
  build_image_non_compiled plos-themes plosthemes
