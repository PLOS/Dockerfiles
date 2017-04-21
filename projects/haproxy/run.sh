#!/usr/bin/env bash

# set -x

# BUILD_DIR=/root
# source $BUILD_DIR/run-helpers.sh

function process_env_template {
	CONTEXT_TEMPALTE=$1

  ls -lh $CONTEXT_TEMPALTE

	echo "Processing template $CONTEXT_TEMPALTE"

  eval "cat <<EOF
$(<$CONTEXT_TEMPALTE)
EOF
" > $CONTEXT_TEMPALTE
}

process_env_template /root/haproxy.ssl.cfg

CMD ["haproxy", "-f", "/root/haproxy.ssl.cfg"]
