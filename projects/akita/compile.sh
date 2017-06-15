#!/usr/bin/env bash

source /envoy/compile-helpers.sh

compile_prepare

mkdir $BUILDDIR/rails
mv /root/src/frontend /tmp/frontend
mv /root/src/* $BUILDDIR/rails

cd /tmp/frontend

# only run the setup if the dependencies are missing
ls node_modules || bin/setup
ls dist || ./node_modules/.bin/ember build --environment=production

cp -r dist $BUILDDIR/ember

echo `node -e "var fs = require('fs');console.log(JSON.parse(fs.readFileSync('package.json', 'utf8'))['version']);"` > $BUILDDIR/version.txt
