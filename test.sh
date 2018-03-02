#!/bin/bash

set -e -x

export RAILS_ENV=test
export BUNDLE_WITHOUT=development

bundle install --quiet
bundle exec bowndler install
bundle exec brakeman -q --no-pager --ensure-latest
bundle exec rubocop .
bundle exec rspec -f progress
bundle exec cucumber -f progress

npm install
./node_modules/karma/bin/karma start spec/javascripts/karma.conf.js
