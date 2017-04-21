#!/usr/bin/env bash

source $HOME/run-helpers.sh

require_mysql_envs
require_envs CAS_DATABASE REGISTRATION_BASE_URL

# process_env_template ${CATALINA_HOME}/conf/context.xml

wait_for_web_service $NED_SERVICE/service/config "NED"

if ! check_db_exists ${CAS_DATABASE}; then
  create_db ${CAS_DATABASE}
  $MYSQL_ROOT $MYSQL_DATABASE < $HOME/cas*.sql
fi

start_consul_agent &

start_tomcat
