#!/bin/bash

source /shared/compile-helpers.sh

java_compile_prepare

mvn -Dmaven.test.skip=true clean package
cp target/*.war $BUILDDIR

# TODO: get jar copying to work
cp $(find $MVN_REPO/mysql/mysql-connector-java -name mysql-connector-java-*.jar| head -n1) $BUILDDIR
cp $(find $MVN_REPO/org/apache/tomcat/tomcat-jdbc -name tomcat-jdbc-7*.jar| head -n1) $BUILDDIR

# fetch_local_library org/apache/tomcat/tomcat-jdbc tomcat-jdbc-7*.jar

java_compile_finish "target/maven-archiver/pom.properties"
