Mas::Cms::Client.config do |c|
  c.timeout = ENV['HTTP_REQUEST_TIMEOUT'].to_i
  c.open_timeout = ENV['HTTP_REQUEST_TIMEOUT'].to_i
  c.host =  ENV['FINCAP_CMS_URL']
  c.retries = 1
  c.cache = Rails.cache
  c.cache_gets = false
end

class Mas::Cms::Insight < Mas::Cms::Document
end

class Mas::Cms::Evaluation < Mas::Cms::Document
end
