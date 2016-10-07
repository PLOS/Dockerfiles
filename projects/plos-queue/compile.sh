#!/usr/bin/env bash

source /shared/compile-helpers.sh

java_compile_prepare

mvn -Dmaven.exec.skip=true -Dmaven.test.skip=true install
ls -l
pwd
echo $BUILDDIR
cp target/*.tar.gz $BUILDDIR
cp -r src/main/bin $BUILDDIR

java_compile_finish "target/maven-archiver/pom.properties"
