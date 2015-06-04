#!/bin/bash

BUILDDIR="/build"

rm $BUILDDIR/*

echo Compiling

cd /src

echo `pwd`
ls

# TODO: run tests in build
mvn clean install initialize package

cp target/*.war $BUILDDIR
cp logging/log4j.xml $BUILDDIR
cp /scripts/* $BUILDDIR

grep ^version= target/maven-archiver/pom.properties | head -1 | sed 's/^version=//' > $BUILDDIR/version.txt

rm -rf target
