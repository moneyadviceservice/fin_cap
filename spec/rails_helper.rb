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

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
