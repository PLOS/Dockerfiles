#!/bin/bash

BUILD_DIR=/root

SVC_WAR=*.war

source $BUILD_DIR/run-helpers.sh

CONTEXTTEMPLATE=${BUILD_DIR}/context-template.xml

process_template $CONTEXTTEMPLATE

# sed -i "s/\${objstore.type}/InMemoryStore/" $CONTEXTTEMPLATE

cp $CONTEXTTEMPLATE ${CATALINA_HOME}/conf/context.xml

wait_until_db_service_up

if ! check_db_exists; then
  echo "Setting up schema"
  echo "DROP SCHEMA IF EXISTS ${MYSQL_DATABASE}; CREATE SCHEMA ${MYSQL_DATABASE};" | $MYSQL_ROOT
  $MYSQL_ROOT < ${BUILD_DIR}/setup.mysql
  # TODO: run schema migrations
fi

set_db_grants

# wait until tracker is up

while ! mogadm --trackers=$MOGILE_TRACKERS check >/dev/null 2>&1; do
  echo -e "\nMogile tracker not ready ... waiting"
done;

echo "Mogile is ready"

setup_war_in_tomcat

start_tomcat
