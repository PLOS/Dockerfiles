#!/bin/bash

BUILDDIR="/build"
CONTEXTFILE=$BUILDDIR/context.xml

rm $BUILDDIR/*

echo Building NED

cd /src
./ned.sh install

cp target/*.?ar $BUILDDIR

#ln -s $BUILDDIR/named-entity-service-*.war $BUILDDIR/ned.war
cp src/main/resources/ned-*.mysql.sql $BUILDDIR

cp target/classes/version.properties $BUILDDIR/ned.version.properties
cp config/tomcat/context.xml $BUILDDIR/context-template.xml

rm -rf target
