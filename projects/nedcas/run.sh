#!/usr/bin/env bash

source $HOME/run-helpers.sh

require_mysql_envs
require_envs CAS_DATABASE REGISTRATION_BASE_URL

wait_for_web_service $NED_SERVICE/service/config "NED"

if ! check_db_exists ${CAS_DATABASE}; then
  create_db ${CAS_DATABASE}
fi

# set_db_grants

bash $HOME/flyway-*/flyway -url="jdbc:mysql://${MYSQL_HOSTNAME}:3306/${CAS_DATABASE}?useUnicode=true&amp;characterEncoding=utf8" \
    -user=${MYSQL_USER} -password=${MYSQL_USER_PASSWORD} -locations=filesystem:$HOME/migrations migrate

start_consul_agent &

start_tomcat
