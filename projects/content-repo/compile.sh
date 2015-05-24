#!/bin/bash

BUILDDIR="/build"

rm $BUILDDIR/*

echo Compiling

cd /src
mvn -Dmaven.test.skip=true clean package

ls -l target

cp target/*.war $BUILDDIR

#ln -s $BUILDDIR/named-entity-service-*.war $BUILDDIR/ned.war
# cp src/main/resources/ned-*.mysql.sql $BUILDDIR

# cp target/classes/version.properties $BUILDDIR/ned.version.properties
# cp config/tomcat/context.xml $BUILDDIR/context-template.xml
cp /src/src/main/resources/setup.mysql $BUILDDIR
cp /scripts/context.xml $BUILDDIR

grep ^version= target/maven-archiver/pom.properties | head -1 | sed 's/^version=//' > $BUILDDIR/version.txt

rm -rf target
