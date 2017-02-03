#!/usr/bin/env bash

source /flatrack/compile-helpers.sh

compile_prepare

mvn clean package
cp target/*.war $BUILDDIR
cp setup/*.sql $BUILDDIR

maven_fetch_version "target/maven-archiver/pom.properties"
