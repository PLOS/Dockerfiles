#!/bin/bash

source /shared/compile-helpers.sh

java_compile_prepare

# TODO: run tests in build

mvn clean install initialize package
cp target/*.war $BUILDDIR
cp logging/log4j.xml $BUILDDIR

java_compile_finish "target/maven-archiver/pom.properties"
