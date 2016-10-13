#!/bin/bash

source /shared/compile-helpers.sh

java_compile_prepare

mvn clean package
cp target/*.war $BUILDDIR
cp setup/*.sql $BUILDDIR

java_compile_finish "target/maven-archiver/pom.properties"
