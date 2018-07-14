require 'site_prism'

module UI
  class LatestNewsItem < SitePrism::Section
    element :title, '.latest-news__list-item__text'
    element :date, '.latest-news__list-item__date'
    element :link, '.latest-news__list-item__cta'
  end
  
  class Page < SitePrism::Page
    element :hero_description, '.hero__heading'

    sections :latest_news_item, LatestNewsItem, '.latest-news__list-item'
  end
end
