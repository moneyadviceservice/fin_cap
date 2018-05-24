require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
ENV['FINCAP_CMS_URL'] = 'http://localhost:3000'

require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'

if Rails.env.production?
  abort('The Rails environment is running in production mode!')
end

Dir[
  Rails.root.join('spec', 'support', '**.rb')
].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Mas::Cms::Client.config do |c|
  c.timeout = '10'
  c.open_timeout = '10'
  c.api_token = 'mytoken'
  c.host = ENV['FINCAP_CMS_URL']
  c.retries = 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
