#!/bin/bash

SRC=../../../content-repo/

BASEIMAGE=maven:3.3-jdk-7
MAVEN_CACHE=maven_cache
BUILD_CACHE=repobuild
TMP_BUILD_CONTAINER=repo_temp_container
OUTPUTIMAGE=contentrepo

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SRC=$DIR/$SRC

cd $DIR
source ../build-helpers.sh

build_java_service_images

# build mogile images
docker build -t mogiletracker mogiletracker
docker build -t mogilenode mogilenode
