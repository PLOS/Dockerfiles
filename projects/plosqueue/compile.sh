#!/usr/bin/env bash

source /envoy/compile-helpers.sh

compile_prepare

# verify_unchanged src/main/resources/camel.properties 5e7fb6c56af663d25df2814e8278f2a3 # 11.10.16

# it might be called dev-default-camel.properties now

mvn -Dmaven.exec.skip=true -Dmaven.test.skip=true install
ls -l
pwd
echo $BUILDDIR
cp target/*.tar.gz $BUILDDIR
# cp -r src/main/bin $BUILDDIR

maven_fetch_version "target/maven-archiver/pom.properties"
