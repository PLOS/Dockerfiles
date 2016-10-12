#!/usr/bin/env bash

source /shared/compile-helpers.sh

java_compile_prepare
# TODO: actually build PHP app, not java!

cp schema/plosreports.sql $BUILDDIR

echo 'version=unknown' > /tmp/version

java_compile_finish "/tmp/version"
