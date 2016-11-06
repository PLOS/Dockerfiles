#!/usr/bin/env bash

source /shared/compile-helpers.sh

compile_prepare

verify_unchanged src/main/resources/camel.properties f93287a598e754568c99ec249472cff2

mvn -Dmaven.exec.skip=true -Dmaven.test.skip=true install
ls -l
pwd
echo $BUILDDIR
cp target/*.tar.gz $BUILDDIR
cp -r src/main/bin $BUILDDIR

maven_fetch_version "target/maven-archiver/pom.properties"
