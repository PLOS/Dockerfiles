#!/usr/bin/env bash

source $HOME/run-helpers.sh

require_mysql_envs
require_envs REPO_LOCATION CORPUS_BUCKET EDITORIAL_BUCKET \
  QUEUE_LOCATION USER_API_SERVER USER_API_USER USER_API_AUTH

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

# TODO: remove this once DPRO-1205 is resolved
cp -r $HOME/ingest/* $HOME/datastores/ingest/

wait_for_web_service $REPO_LOCATION/config "contentrepo"

curl -X POST $REPO_LOCATION/buckets --data name=corpus

process_env_template $AMBRA_CONF/context.xml
# process_env_template $AMBRA_CONF/ambra.xml      # TODO: figure out if ambra.xml is needed still


$HOME/build_config_rhino.py                \
    --repo_location     $REPO_LOCATION     \
    --corpus_bucket     $CORPUS_BUCKET     \
    --editorial_bucket  $EDITORIAL_BUCKET  \
    --user_api_server   $USER_API_SERVER   \
    --user_api_auth     $USER_API_AUTH     \
    --queue_location    $QUEUE_LOCATION > $AMBRA_CONF/rhino.yaml || die "Config error"

# HACK: inject NED username. needed because username is hardcoded in config
sed -i "s/authorizationAppName:\s*dipro.*/authorizationAppName: $USER_API_USER/" $AMBRA_CONF/rhino.yaml

export JAVA_OPTS="-Drhino.configDir=$AMBRA_CONF"
start_tomcat
