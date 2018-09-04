Algolia.init application_id: ENV['FINCAP_ALGOLIA_APP_ID'],
             api_key:        ENV['FINCAP_ALGOLIA_SEARCH_API_KEY']

SiteSearch.config do |config|
  config.adapter = :algolia
  config.logger = Rails.logger
end
