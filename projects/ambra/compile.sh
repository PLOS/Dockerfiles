#!/bin/bash

source /shared/compile-helpers.sh

java_compile_prepare

# TODO: run tests in build

mvn -Dmaven.test.skip=true clean package
cp webapp/target/*.war $BUILDDIR

java_compile_finish "webapp/target/maven-archiver/pom.properties"
