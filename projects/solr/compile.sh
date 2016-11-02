#!/bin/bash

source /shared/compile-helpers.sh

compile_prepare

# TODO: run tests in build

mvn clean install initialize package
cp target/*.war $BUILDDIR
cp logging/log4j.xml $BUILDDIR

maven_fetch_version "target/maven-archiver/pom.properties"
