#!/usr/bin/env bash

source $HOME/run-helpers.sh

require_mysql_envs
require_envs CAS_DB_NAME CAS_DB_USER CAS_DB_PASSWORD REGISTRATION_BASE_URL

wait_for_web_service $NED_SERVICE/service/config "NED"

if ! check_db_exists ${CAS_DB_NAME}; then
  create_db ${CAS_DB_NAME}
fi

# set_db_grants

bash $HOME/flyway-*/flyway -url="jdbc:mysql://${MYSQL_HOSTNAME}:3306/${CAS_DB_NAME}?useUnicode=true&amp;characterEncoding=utf8" \
    -user=${CAS_DB_USER} -password=${CAS_DB_PASSWORD} -locations=filesystem:$HOME/migrations migrate

start_tomcat
