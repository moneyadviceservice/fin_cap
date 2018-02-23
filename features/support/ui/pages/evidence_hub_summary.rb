module UI
  module Pages
    class EvidenceHubSummary < UI::Page
      set_url "/en/{/page_type}/{/slug}"

      element :evidence_type, '.hero-evidence-hub__title'
    end
  end
end
