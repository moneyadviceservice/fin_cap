require_relative '../pages/home'

module UI
  module Pages
    class Pagination < SitePrism::Section
      element :page_info, '.pagination__counter'
      element :previous_button, '.pagination__prev-page'
      element :next_button, '.pagination__next-page'
    end

    class SearchResults < UI::Page
      set_url '{/locale}/search'

      element :robots_tag, :xpath, "//meta[@name='robots']", visible: false
      element :spelling_suggestion, '.spelling-suggestion'
      element :corrected_query, '.corrected-query'
      elements :results, '.search-results__item'
      section :pagination, Pagination, '.l-pagination'
      section :bottom_search_box, SearchBox, '.footer__search'
    end
  end
end
