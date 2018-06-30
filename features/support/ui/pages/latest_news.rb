module UI
  module Pages
    class NewsItems < SitePrism::Section
      element :link, 'a'
    end

    class LatestNews < UI::Page
      set_url '/en/news/'

      element :main_description, '.hero'
      sections :news_items, NewsItems, '.l-2col-main li'
    end
  end
end
