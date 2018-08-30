Mas::Cms::Client.config do |c|
  c.timeout = ENV['FRONTEND_HTTP_REQUEST_TIMEOUT'].to_i
  c.open_timeout = ENV['FRONTEND_HTTP_REQUEST_TIMEOUT'].to_i
  c.host = ENV['FINCAP_CMS_URL']
  c.api_token = ENV['FINCAP_CMS_API_TOKEN']
  c.retries = 1
  c.cache = Rails.cache
  c.cache_gets = false
end

class Mas::Cms::Evaluation < Mas::Cms::Document
end

class Mas::Cms::Insight < Mas::Cms::Document
end

class Mas::Cms::Homepage < Mas::Cms::Article
end

class Mas::Cms::LatestNews < Mas::Cms::Article
  PAGE_TYPE = 'latest_news'.freeze
end

class Mas::Cms::Lifestage < Mas::Cms::Article
end

class Mas::Cms::News < Mas::Cms::Article
  PAGE_TYPE = 'news'.freeze

  def published_date
    content = non_content_blocks.find do |block|
      block.identifier == 'order_by_date'
    end.content

    Date.parse(ActionView::Base.full_sanitizer.sanitize(content.strip))
  end
end

class Mas::Cms::Review < Mas::Cms::Document
end

class Mas::Cms::RegionalStrategy < Mas::Cms::Article
end

class Mas::Cms::ThematicReview < Mas::Cms::Article
end

class Mas::Cms::ThematicReviewsLandingPage < Mas::Cms::Article
end

class Mas::Cms::UkStrategy < Mas::Cms::Article
end
