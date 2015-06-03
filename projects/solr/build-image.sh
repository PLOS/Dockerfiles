#!/bin/bash

PROJECTNAME=solr
PROJECTDIR=solr

BASEIMAGE=maven:3.3-jdk-8

SRC=../../../${PROJECTDIR}/

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SRC=$DIR/$SRC

cd $DIR
source ../build-helpers.sh

build_java_service_images
