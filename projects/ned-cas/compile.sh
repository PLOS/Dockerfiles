#!/bin/bash

source /shared/compile-helpers.sh

java_compile_prepare

mvn clean package
cp target/*.war $BUILDDIR

java_compile_finish "target/maven-archiver/pom.properties"
