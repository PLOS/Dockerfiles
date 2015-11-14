#!/bin/bash

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

if ! check_db_exists; then
  create_db
fi

bash flyway-*/flyway -url="jdbc:mysql://${MYSQL_HOSTNAME}:3306/${MYSQL_DATABASE}?useUnicode=true&amp;characterEncoding=utf8" \
    -user=${MYSQL_USER} -password=${MYSQL_USER_PASSWORD} -locations=filesystem:migrations migrate

# ambra DB

if ! check_db_exists ${AMBRA_DATABASE}; then
  create_db ${AMBRA_DATABASE}
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/ambra_users.sql
fi

set_db_grants

# insert dev:dev user for userapp authentication
unzip -q $CATALINA_HOME/webapps/v0.war -d $BUILD_DIR/ned
cd $BUILD_DIR/ned/WEB-INF
PASSWORD=$(java -cp classes:$(ls lib/spring-security-crypto-*.RELEASE.jar | head -1) org.plos.namedentity.spring.security.BCrypt dev)
echo "REPLACE INTO namedEntities.consumers (name, password) VALUES ('dev','${PASSWORD}');" | $MYSQL_ROOT
echo "SELECT * FROM namedEntities.consumers;" | $MYSQL_ROOT

process_template ${CATALINA_HOME}/conf/context.xml

start_tomcat
