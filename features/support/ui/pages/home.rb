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

    class SearchBox < SitePrism::Section
      element :input, '.search__input'
      element :submit, '.search__submit'
    end

    class Home < UI::Page
      set_url '/'

      elements :main_content, '.l-2col-side'
      section :horizontal_teaser, HorizontalTeaser, '.teaser-box--horizontal'
      sections :ctas, Ctas, '.l-2col-even'
      section :top_search_box, SearchBox, '.nav__search-bar'
      section :bottom_search_box, SearchBox, '.footer__search'
    end
  end
end
