module UI
  module Pages
    class Countries < SitePrism::Section
      element :title, 'h2'
      element :content, 'p'
      elements :links, 'a'
    end

    class RegionalStrategy < ::UI::Pages::Article
      set_url '/en/regional_strategies/{/slug}'

      element :main_description, '.hero'
      element :latest_news, '.latest-news'
      element :country_list, 'ul.list--countries'
    end
  end
end
