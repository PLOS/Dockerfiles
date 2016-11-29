#!/usr/bin/env bash

source /flatrack/compile-helpers.sh

compile_prepare

mvn -Dmaven.test.skip=true clean package
cp target/*.war $BUILDDIR
cp src/main/resources/setup.mysql $BUILDDIR

maven_fetch_version "target/maven-archiver/pom.properties"
