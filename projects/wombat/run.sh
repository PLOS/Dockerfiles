#!/usr/bin/env bash

# set -x

source $HOME/run-helpers.sh

[ -d "$ROOT" ] || die "Theme root not found"

require_envs SERVER SOLR EMAIL ROOT CAS

wait_for_web_service $SERVER/journals "Rhino"

# NOTE; we dont wait for CAS because it can sometimes use the public facing route (ie - localhost) which is not accessable inside the NAT.

# handle optional values
[ -z $ROOT_PAGE_PATH ] || ROOT_PAGE_PATH=" --root_page_path $ROOT_PAGE_PATH "

[ "$DISABLE_COMMENTS" != "true"] || DISABLE_COMMENTS_ARG=" --disable_comments "

# generate the config
$HOME/build_config_wombat.py $ROOT_PAGE_PATH $DISABLE_COMMENTS_ARG \
    --http_pool 1000       \
    --server $SERVER       \
    --solr $SOLR           \
    --email $EMAIL         \
    --root $ROOT           \
    --cas $CAS      > $AMBRA_CONF/wombat.yaml || die "Config error"
    # --prodsites                              \
    # --memcached                              \
    # --assets "/var/local/wombat/compiledAssets"  \

# TODO: handle Akita URL for create account page

start_tomcat
