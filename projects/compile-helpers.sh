#!/bin/bash

# set -x

BUILDDIR="/build"

function java_compile_prepare {

  rm $BUILDDIR/*

  echo Compiling

  cd /src
}

function java_compile_finish {

  PROPERTIES_FILE=$1

  cp /scripts/* $BUILDDIR
  cp /shared/run-helpers.sh $BUILDDIR

  grep ^version= $PROPERTIES_FILE | head -1 | sed 's/^version=//' > $BUILDDIR/version.txt

  ls -lh $BUILDDIR

  rm -rf target
}
