#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
# set +vx

set -x

if [[ $(uname) == "Darwin" ]]; then
  which identify || brew install imagemagick
  brew leaves | grep 'libmagic' || brew install libmagic
  # which watchman || brew install watchman
  which phantomjs || brew install phantomjs
fi

gem list -i bundler || gem install bundler
bundle install

# database for Collections
# test -e config/database.yml || cp config/database.yml.example config/database.yml
# test -e config/jackalope.yml || cp config/jackalope.yml.example config/jackalope.yml

# echo "Rails is all set. Run the tests with 'bin/rake', and the local server with 'bin/rails s'"

echo "Running frontend setup..."
cd frontend
#./bin/setup

## start frontend script



cd "$(dirname $0)/.."
PROJECT="$PWD"

# check package versions
# NPM_VERSION=$(npm -v)
# EXPECTED_NPM_VERSION='2.14.13'
# if [[ $NPM_VERSION != $EXPECTED_NPM_VERSION  ]]; then
#   echo "ERROR: npm version mismatch. You have $NPM_VERSION but I need $EXPECTED_NPM_VERSION" 1>&2
#   exit 1
# fi
#
# BOWER_VERSION=$(bower -v)
# EXPECTED_BOWER_VERSION='1.7.0'
# if [[ $BOWER_VERSION != $EXPECTED_BOWER_VERSION  ]]; then
#   echo "ERROR: bower version mismatch. You have $BOWER_VERSION but I need $EXPECTED_BOWER_VERSION" 1>&2
#   exit 1
# fi

# uninstall lemur-commons to force it use any updates on the filesystem
# npm uninstall lemur-commons

# if [[ -z "${TEAMCITY_VERSION:-}" ]]; then
#   cd "lemur-vendor/lemur-commons"
#   bin/setup
#   cd "$PROJECT"
#
#   npm link lemur-commons
# fi

# install npm packages
npm install

# remove unused npm components
npm prune

# install bower components
# BOWER=./node_modules/ember-cli/node_modules/bower/bin/bower
which bower || npm install -g bower

bower install --allow-root

bin/ember version || (rm -rf node_modules/ bower_components/ && npm install && bower install)

bin/ember version
# echo 'The collections ember app is all set up. Go ahead and run `bin/ember serve` and browse to http://localhost:4200 to see the app. Tests are available at http://localhost:4200/tests.'




## end frontend script

cd ..

# echo "Running jolene setup..."
# cd frontend/lemur-vendor/jolene
# ./bin/setup
# cd ../../..
#
# echo "Lemur-collections is all set up. Run the rails and ember local servers together with 'foreman start'."
