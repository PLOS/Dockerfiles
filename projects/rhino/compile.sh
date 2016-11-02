#!/bin/bash

source /shared/compile-helpers.sh

compile_prepare

mvn -Dmaven.test.skip=true clean package
cp target/*.war $BUILDDIR
cp -r src/main/python/dbschema $BUILDDIR

maven_fetch_version "target/maven-archiver/pom.properties"
