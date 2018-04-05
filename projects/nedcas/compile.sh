#!/usr/bin/env bash

source /envoy/compile-helpers.sh

compile_prepare

./build.sh package
cp target/*.war $BUILDDIR
cp -r setup/* $BUILDDIR/

ls -l $BUILDDIR

maven_fetch_version "target/maven-archiver/pom.properties"
