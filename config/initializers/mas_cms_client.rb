Mas::Cms::Client.config do |c|
  c.timeout =  ENV['FINCAP_CMS_HTTP_REQUEST_TIMEOUT'].to_i
  c.open_timeout =  ENV['FINCAP_CMS_HTTP_REQUEST_TIMEOUT'].to_i
  c.host =  ENV['FINCAP_CMS_URL']
  c.cache = Rails.cache
  c.cache_gets  = false
end

class Mas::Cms::Insight < Mas::Cms::Page
end
