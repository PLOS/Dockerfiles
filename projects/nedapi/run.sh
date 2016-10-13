#!/usr/bin/env bash

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

# ned DB

if ! check_db_exists; then
  create_db
else
  echo "Skipping creating DB since it already exists"
fi

set_db_grants

bash flyway-*/flyway -url="jdbc:mysql://${MYSQL_HOSTNAME}:3306/${MYSQL_DATABASE}?useUnicode=true&amp;characterEncoding=utf8" \
    -user=${MYSQL_USER} -password=${MYSQL_USER_PASSWORD} -locations=filesystem:migrations migrate

# ringgold DB

if ! check_db_exists ${RINGGOLD_DATABASE}; then
  create_db ${RINGGOLD_DATABASE}
fi

# TODO: move this to some kind of optional dev seeding powered by an environment varriable perhaps?
# maybe also include some users in the seed like devreader@mailinator.com:plos1234, devadmin@mailinator.com:plos1234
# insert dev:dev user for userapp authentication
unzip -q $CATALINA_HOME/webapps/v?.war -d $BUILD_DIR/ned
cd $BUILD_DIR/ned/WEB-INF
PASSWORD=$(java -cp classes:$(ls lib/spring-security-crypto-*.RELEASE.jar | head -1) org.plos.namedentity.spring.security.BCrypt dev)
echo "REPLACE INTO namedEntities.consumers (name, password) VALUES ('dev','${PASSWORD}');" | $MYSQL_ROOT
echo "SELECT * FROM namedEntities.consumers;" | $MYSQL_ROOT

process_template ${CATALINA_HOME}/conf/context.xml

start_consul_agent

start_tomcat
