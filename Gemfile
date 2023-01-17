ruby File.read('.ruby-version', &:readline)

source 'https://rubygems.org'

source 'https://gem.fury.io/h_app288206558' do
  gem 'dough-ruby', '~> 5.28'
  gem 'mas-cms-client', '1.18.0'
  gem 'site_search', '0.2.0'
end

gem 'rails', '~> 5.0.7'

gem 'algoliasearch'
gem 'autoprefixer-rails'
gem 'bowndler', '~> 1.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'meta-tags'
gem 'newrelic_rpm'
gem 'nokogiri'
gem 'okcomputer'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'puma'
gem 'rack-canonical-host'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'brakeman', require: false
  gem 'capybara'
  gem 'cucumber-rails', require: false
  gem 'danger', require: false
  gem 'danger-rubocop', require: false
  gem 'dotenv-rails'
  gem 'launchy'
  gem 'pry-byebug'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop', '~> 0.58.2', require: false
  gem 'site_prism'
  gem 'tzinfo-data'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
end
