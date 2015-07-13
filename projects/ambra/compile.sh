#!/bin/bash

source /shared/compile-helpers.sh

java_compile_prepare

# mvn clean dependency:purge-local-repository install
mvn -Dmaven.test.skip=true clean package
cp webapp/target/*.war $BUILDDIR

java_compile_finish "webapp/target/maven-archiver/pom.properties"
