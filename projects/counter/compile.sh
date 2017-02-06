#!/usr/bin/env bash

source /envoy/compile-helpers.sh

compile_prepare
# TODO: actually build PHP app, not java!

cp schema/plosreports.sql $BUILDDIR

echo 'version=unknown' > /tmp/version

maven_fetch_version "/tmp/version"
