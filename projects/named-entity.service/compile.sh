#!/bin/bash

BUILDDIR="/build"
CONTEXTFILE=$BUILDDIR/context.xml

rm $BUILDDIR/*

echo Compiling

cd /src
./ned.sh install

ls -l target

cp target/*.?ar $BUILDDIR

#ln -s $BUILDDIR/named-entity-service-*.war $BUILDDIR/ned.war
cp src/main/resources/ned-*.mysql.sql $BUILDDIR

# cp target/classes/version.properties $BUILDDIR/ned.version.properties
# cp config/tomcat/context.xml $BUILDDIR/context-template.xml
cp /scripts/context-template.xml $BUILDDIR

grep ^version= target/classes/version.properties | head -1 | sed 's/^version=//' > $BUILDDIR/version.txt

rm -rf target
