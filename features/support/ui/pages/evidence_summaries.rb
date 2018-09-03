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
      element :qualitative, '.data-types__qualitative svg'
      element :quantitative, '.data-types__quantitative svg'
      element :programme_theory, '.data-types__programme-theory svg'
      element :measured_outcomes, '.data-types__measured-outcomes svg'
      element :causality, '.data-types__causality svg'
      element :process_evaluation, '.data-types__process-evaluation svg'
      element :value_for_money, '.data-types__value-for-money svg'
      element :info_icon, 'a.icon--info'
    end

    class FilterInput < SitePrism::Section
      element :input, 'input'
    end

    class SearchFilter < SitePrism::Section
      element :title, 'legend'
      sections :filter_inputs, FilterInput, 'label'

      def find_filter(value)
        filter_inputs.find { |label| label.input.value == value }
      end
    end

    class Pagination < SitePrism::Section
      element :previous_button, '.pagination__prev-page'
      element :next_button, '.pagination__next-page'
    end

    set_url '{/locale}/evidence_hub'

    # searching/filtering elements
    element :keyword, '#evidence_summary_search_form_keyword'
    element :search_button, '.sidepanel button[type="submit"]'
    element :saving_filter, '#evidence_summary_search_form_topics_saving'
    element :older_people_filter,
            '#evidence_summary_search_form_client_groups_older-people-65'
    element :social_housing_tenants_filter,
            '#evidence_summary_search_form_client_groups_social-housing-tenants'
    element :children_filter,
            '#evidence_summary_search_form_client_groups_children-3-11'
    element :last_2_years_filter,
            '#evidence_summary_search_form_year_of_publication_last-2-years'
    element :evaluation_filter,
            '#evidence_summary_search_form_evidence_types_evaluation'
    element :insight_filter,
            '#evidence_summary_search_form_evidence_types_insight'
    element :review_filter,
            '#evidence_summary_search_form_evidence_types_review'
    element :clear_filters_button, '.sidepanel__clear-filters'

    element :thematic_review_message, '.evidence-hub__thematic-review-message'
    element :thematic_review_message_link,
            '.evidence-hub__thematic-review-message a'

    sections :search_results, SearchResult, '.search-results__item'
    sections :search_filters, SearchFilter, '.sidepanel__filters-inner .sidepanel__fieldset'

    sections :pagination, Pagination, '.pagination__wrap'

    def find_filter_group(title)
      search_filters.find { |filter_group| filter_group.title.text == title }
    end

    def previous_page
      pagination.first.previous_button
    end

    def next_page
      pagination.first.next_button
    end
  end
end
