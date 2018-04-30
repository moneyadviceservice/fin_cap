#!/bin/bash

set -e

export PATH=./bin:$PATH
export RAILS_ENV=test
export BUNDLE_WITHOUT=development

bundle install
npm install
bundle exec bowndler update
bundle exec rake db:drop db:create db:schema:load db:migrate
bundle exec rake
bundle exec brakeman -q --no-pager --ensure-latest
bundle exec rubocop .
./node_modules/karma/bin/karma start spec/javascripts/karma.conf.js
