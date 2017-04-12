#!/usr/bin/env bash

source $HOME/run-helpers.sh

require_mysql_envs
require_envs REPO_LOCATION CORPUS_BUCKET

wait_until_db_service_up

if ! check_db_exists; then
  echo "CREATE SCHEMA $MYSQL_DATABASE" | $MYSQL_ROOT

  # HACK: after conversation with dipros on 9/19/2016 it appears there is a future goal to move to something like flyway where migrations from scratch will be supported

  $MYSQL_ROOT $MYSQL_DATABASE < ${HOME}/ambra_pre_migrations.sql


  # NOTE: these old python migrations might be data destructive, so this might not always work right
  cd $HOME
  python migrate.py --dbUser=root --dbPass=$MYSQL_ROOT_PASSWORD --dbHost=$MYSQL_HOSTNAME --dbName=$MYSQL_DATABASE

fi

set_db_grants

# NOTE: these modes do not play well with eachother. you need to clear the db between switching modes

# HACK: until dipro migrations get figured out, we smash some journal data in
if [[ "$MODE" == "plos" ]]; then
  echo "running in PLOS mode"
  echo "DELETE FROM journal WHERE title= 'My Journal'" | $MYSQL_ROOT $MYSQL_DATABASE || exit 1
elif [[ "$MODE" == "example" ]]; then
  echo "running in example mode"
  # when using this https://plos.github.io/ambraproject/Quickstart-Guide.html
  echo "DELETE FROM journal" | $MYSQL_ROOT $MYSQL_DATABASE || exit 1
  $MYSQL_ROOT $MYSQL_DATABASE < ${HOME}/example_mode.sql
else
  # the user is on their own to populate the journals table/
  echo "DELETE FROM journal" | $MYSQL_ROOT $MYSQL_DATABASE || exit 1
fi


# TODO: remove this once DPRO-1205 is resolved
cp -r $HOME/ingest/* $HOME/datastores/ingest/

wait_for_web_service $REPO_LOCATION/config "contentrepo"

# create the bucket if it doesnt exist
curl $REPO_LOCATION/buckets/$CORPUS_BUCKET | grep -i "bucket not found"
[ $? -eq 0 ] && curl -X POST $REPO_LOCATION/buckets --data name=$CORPUS_BUCKET

process_env_template $AMBRA_CONF/context.xml

# TODO: fetch rhino.yaml from salt (https://github.com/PLOS-Formulas/rhino-formula/blob/dev/rhino/conf/opt/plos/rhino/conf/rhino.yaml)? or better yet from the rhino repo if it gets added to the deb
process_env_template $AMBRA_CONF/rhino.yaml

# $HOME/build_config_rhino.py                \
#     --repo_location     $REPO_LOCATION     \
#     --corpus_bucket     $CORPUS_BUCKET     \
#     --editorial_bucket  $EDITORIAL_BUCKET  \
#     --user_api_server   $USER_API_SERVER   \
#     --user_api_auth     $USER_API_AUTH     \
#     --queue_location    $QUEUE_LOCATION > $AMBRA_CONF/rhino.yaml || die "Config error"
#
# # HACK: inject NED username. needed because username is hardcoded in config
# sed -i "s/authorizationAppName:\s*dipro.*/authorizationAppName: $USER_API_USER/" $AMBRA_CONF/rhino.yaml

export JAVA_OPTS="-Drhino.configDir=$AMBRA_CONF"
start_tomcat
