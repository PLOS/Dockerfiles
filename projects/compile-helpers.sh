#!/bin/bash

set -x

BUILDDIR="/build"
MVN_REPO="/root/.m2/repository"

# TODO: run tests in build

function java_compile_prepare {

  rm $BUILDDIR/*

  echo Compiling

  cd /src
  mkdir /root/src
  cp -r `ls -A | grep -Ev ".git|target"` /root/src
  cd /root/src
  pwd
  du -sh
  ls -la
}

# WIP
function fetch_local_library {
  SUBDIR=$1
  NAME=$2

  # ls -R /root/.m2/repository/$SUBDIR

  cp $(find /root/.m2/repository/$SUBDIR -name $NAME| head -n1) $BUILDDIR
}

function java_compile_finish {

  PROPERTIES_FILE=$1

  cp /scripts/* $BUILDDIR
  cp /shared/run-helpers.sh $BUILDDIR

  grep ^version= $PROPERTIES_FILE | head -1 | sed 's/^version=//' > $BUILDDIR/version.txt

  ls -lh $BUILDDIR

}
