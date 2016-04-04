#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
set +vx

createuser -d lemur || echo "already exists"
# createdb -O lemur lemur_collections_development || echo "already exists"
# createdb -O lemur lemur_collections_test || echo "already exists"
createdb -O lemur lemur_collections_production || echo "already exists"

# create dev database
bin/rake db:drop db:create db:schema:load --trace
# reload db schema before creating seeds; factories depend on it
bin/rake db:seed

# create test database
RAILS_ENV=test bin/rake db:drop db:create db:schema:load --trace
# reload db schema before creating seeds; factories depend on it
RAILS_ENV=test bin/rake db:seed --trace

# create jackalope user
createuser -d jackalope || echo "already exists"
