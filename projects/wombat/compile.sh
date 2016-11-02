#!/bin/bash

source /shared/compile-helpers.sh

compile_prepare

mvn -Dmaven.test.skip=true clean package
cp target/*.war $BUILDDIR

maven_fetch_version "target/maven-archiver/pom.properties"
