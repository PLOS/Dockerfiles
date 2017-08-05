#!/usr/bin/env bash

source /envoy/compile-helpers.sh

compile_prepare

# TODO: perhaps we can build this again using alpine and combine it with an alpine node via multistage build so we dont have to download the large debian JDK image. this mean mvn here would have to skip the node phase somehow

mvn -Dmaven.test.skip=true clean package
cp target/*.war $BUILDDIR

maven_fetch_version "target/maven-archiver/pom.properties"
