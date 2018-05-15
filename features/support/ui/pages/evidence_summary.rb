module UI
  module Pages
    class EvidenceSummary < UI::Page
      set_url '/en/{/page_type}/{/slug}'
      element :evidence_type, '.hero-evidence-hub__title'
      element :evidence_title, '.evidence-hub__title'
      element :content, '.evidence-hub__content'
      element :client_groups, '.evidence-hub__client_groups'
      element :activities_and_setting, '.evidence-hub__activities_and_setting'
      element :measured_outcomes, '.evidence-hub__measured_outcomes'
      element :programme_delivery, '.evidence-hub__programme_delivery'
      element :topics, '.evidence-hub__topics'
      element :year_of_publication, '.evidence-hub__year_of_publication'
      element :country, '.evidence-hub__country'
      element :contact_information, '.evidence-hub__contact_information'
      element :links, '.evidence-hub__links'
      element :qualitative, '.data-types__qualitative svg'
      element :quantitative, '.data-types__quantitative svg'
      element :programme_theory, '.data-types__programme-theory svg'
      element :measured_outcomes_checklist, '.data-types__measured-outcomes svg'
      element :causality, '.data-types__causality svg'
      element :process_evaluation, '.data-types__process-evaluation svg'
      element :value_for_money, '.data-types__value-for-money svg'
      element :systematic_review, '.data-types__systematic-review svg'
      element :literature_review, '.data-types__literature-review svg'
    end
  end
end
