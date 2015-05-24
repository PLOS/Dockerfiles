#!/bin/bash

SRC=../../../ned-cas/

BASEIMAGE=maven:3.3-jdk-8
MAVEN_CACHE=maven_cache
BUILD_CACHE=nedcasbuild
TMP_BUILD_CONTAINER=nedcas_temp_container
OUTPUTIMAGE=nedcas

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SRC=$DIR/$SRC

cd $DIR
source ../build-helpers.sh

build_java_service_images
