#!/bin/bash

BUILDDIR="/build"

rm $BUILDDIR/*

echo Compiling

cd /src

# TODO: run tests in build
mvn -Dmaven.test.skip=true clean package

cp webapp/target/*.war $BUILDDIR
cp /scripts/* $BUILDDIR

grep ^version= webapp/target/maven-archiver/pom.properties | head -1 | sed 's/^version=//' > $BUILDDIR/version.txt

rm -rf target
