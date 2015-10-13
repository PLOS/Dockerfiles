#!/bin/bash

source /shared/compile-helpers.sh

java_compile_prepare

cd config/docker-maven-plugin
mvn clean install
cd ../..

mvn -Dmaven.exec.skip=true -Dmaven.test.skip=true install
cp target/*.?ar $BUILDDIR
cp src/main/resources/ned-*.mysql.sql $BUILDDIR

java_compile_finish "target/classes/version.properties"
