require_relative '../page'

module UI::Pages
  class EvidenceSummaries < UI::Page
    class SearchResult < SitePrism::Section
      element :document_title, '.search-results__title'
      element :evidence_type, '.search-results__evidence-type'
      element :overview, '.search-results__description'
      element :topics, '.search-results__topics'
      element :countries, '.search-results__countries'
      element :year_of_publication, '.search-results__year-of-publication'
    end

    set_url '{/locale}/evidence_hub'

    element :keyword, '#evidence_summary_search_form_keyword'
    element :search_button, '.sidepanel button[type="submit"]'
    element :older_people_filter, '#evidence_summary_search_form_client_groups_older-people-65'
    element :clear_filters_button, '.sidepanel__clear-filters'

    sections :search_results, SearchResult, '.search-results li'
  end
end
