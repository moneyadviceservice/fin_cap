module UI
  module Pages
    class HorizontalTeaser < SitePrism::Section
      element :title, '.teaser-box__title'
      element :content, '.teaser-box__content-text'
      element :link, '.teaser-box__cta'
    end

    class Ctas < SitePrism::Section
      element :link, 'a'
    end

    class Home < UI::Page
      set_url '/'

      elements :main_content, '.l-2col-side'
      section :horizontal_teaser, HorizontalTeaser, '.teaser-box--horizontal'
      sections :ctas, Ctas, '.l-2col-even'
    end
  end
end
