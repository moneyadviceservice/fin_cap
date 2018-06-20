Mas::Cms::Client.config do |c|
  c.timeout = ENV['FRONTEND_HTTP_REQUEST_TIMEOUT'].to_i
  c.open_timeout = ENV['FRONTEND_HTTP_REQUEST_TIMEOUT'].to_i
  c.host = ENV['FINCAP_CMS_URL']
  c.api_token = ENV['MAS_CMS_API_TOKEN']
  c.retries = 1
  c.cache = Rails.cache
  c.cache_gets = false
end

class Mas::Cms::Evaluation < Mas::Cms::Document
end

class Mas::Cms::Insight < Mas::Cms::Document
end

class Mas::Cms::Lifestage < Mas::Cms::Article
end

class Mas::Cms::News < Mas::Cms::Article
end

class Mas::Cms::Review < Mas::Cms::Document
end

class Mas::Cms::ThematicReview < Mas::Cms::Article
end

class Mas::Cms::ThematicReviewsLandingPage < Mas::Cms::Article
end
