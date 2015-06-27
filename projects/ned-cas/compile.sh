#!/bin/bash

BUILDDIR="/build"

rm $BUILDDIR/*

echo Compiling

cd /src
mvn clean package

cp target/*.war $BUILDDIR

cp /scripts/* $BUILDDIR
cp /shared/run-helpers.sh $BUILDDIR

grep ^version= target/maven-archiver/pom.properties | head -1 | sed 's/^version=//' > $BUILDDIR/version.txt

rm -rf target
