#!/bin/bash

SRC=../../../named-entity.service/

BASEIMAGE=maven:3.3-jdk-8
MAVEN_CACHE=maven_cache
BUILD_CACHE=nedbuild
TMP_BUILD_CONTAINER=ned_temp_container
OUTPUTIMAGE=nedapi

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SRC=$DIR/$SRC

cd $DIR
source ../build-helpers.sh

build_java_service_images
