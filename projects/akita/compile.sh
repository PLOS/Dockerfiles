#!/usr/bin/env bash

source /envoy/compile-helpers.sh

compile_prepare

mkdir rails
# cp -r `ls -A | grep -Ev "frontend"` $BUILDDIR/rails
mv /root/src/* $BUILDDIR/rails
rm -rf $BUILDDIR/frontend

cd frontend

# only run the setup if the dependencies are missing
ls node_modules || bin/setup
ls dist || ./node_modules/.bin/ember build --environment=production

cp -r dist $BUILDDIR/ember

# ls -l ..

echo `node -e "var fs = require('fs');console.log(JSON.parse(fs.readFileSync('package.json', 'utf8'))['version']);"` > $BUILDDIR/version.txt
