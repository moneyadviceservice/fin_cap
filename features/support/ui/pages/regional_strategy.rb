module UI
  module Pages
    class RegionalStrategy < ::UI::Pages::Article
      set_url '/en/regional_strategies/{/slug}'

      element :main_description, '.hero'
    end
  end
end
