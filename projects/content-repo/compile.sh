#!/bin/bash

source /shared/compile-helpers.sh

java_compile_prepare

mvn -Dmaven.test.skip=true clean package
cp target/*.war $BUILDDIR
cp src/main/resources/setup.mysql $BUILDDIR

java_compile_finish "target/maven-archiver/pom.properties"
