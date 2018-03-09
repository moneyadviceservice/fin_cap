module UI
  module Pages
    class EvidenceSummary < UI::Page
      set_url '/en/{/page_type}/{/slug}'
      element :evidence_type, '.hero-evidence-hub__title'
      element :evidence_title, '.evidence-hub__title'
      element :content, '.evidence-hub__content'
      element :client_groups, '.evidence-hub__client_groups'
      element :topics, '.evidence-hub__topics'
      element :year_of_publication, '.evidence-hub__year_of_publication'
      element :country, '.evidence-hub__country'
      element :contact_information, '.evidence-hub__contact_information'
      element :links, '.evidence-hub__links'
    end
  end
end
