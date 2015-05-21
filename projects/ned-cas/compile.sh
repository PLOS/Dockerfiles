#!/bin/bash

BUILDDIR="/build"

rm $BUILDDIR/*

echo Building NED

cd /src

echo `pwd`
ls

# TODO: run tests in build
mvn clean package

cp target/*.war $BUILDDIR
cp /scripts/context-template.xml $BUILDDIR

grep ^version= target/maven-archiver/pom.properties | head -1 | sed 's/^version=//' > $BUILDDIR/version.txt

rm -rf target
