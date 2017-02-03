#!/usr/bin/env bash

source /flatrack/compile-helpers.sh

compile_prepare

mvn -Dmaven.exec.skip=true -Dmaven.test.skip=true install
ls -l
pwd
echo $BUILDDIR
cp target/*.?ar $BUILDDIR

maven_fetch_version "target/maven-archiver/pom.properties"
