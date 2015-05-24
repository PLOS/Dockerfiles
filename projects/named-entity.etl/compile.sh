#!/bin/bash

BUILDDIR="/build"

echo Building ETL

cd /src/lib
./install-jars-in-local-mvn-repo.sh
cd ..
mvn clean package

cp target/*.jar $BUILDDIR
cp $BUILDDIR/named-entity-etl-*-jar-with-dependencies.jar $BUILDDIR
cp $BUILDDIR/named-entity-etl-*-jar-with-dependencies.jar $BUILDDIR/ned-etl.jar

grep ^version= target/maven-archiver/pom.properties | head -1 | sed 's/^version=//' > $BUILDDIR/version.txt

rm -rf target
