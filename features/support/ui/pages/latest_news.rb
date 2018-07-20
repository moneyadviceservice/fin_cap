module UI
  module Pages
    class NewsItems < SitePrism::Section
      element :date, '.latest-news__list-item__date'
      element :link, 'a'
    end

    class LatestNews < UI::Page
      set_url '/en/news/'

      elements :cta_links, '.list--grouped-cta li a'
      sections :news_items, NewsItems, '.latest-news__list-item'
    end
  end
end
