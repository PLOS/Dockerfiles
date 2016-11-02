#!/bin/bash

source /shared/compile-helpers.sh

compile_prepare

cd config/docker-maven-plugin
mvn clean install
cd ../..

mvn -Dmaven.exec.skip=true -Dmaven.test.skip=true install || die "compile failed"
cp target/*.?ar $BUILDDIR
cp -r database/migrations/ $BUILDDIR/

maven_fetch_version "target/classes/version.properties"
