class EvidenceHub::Filters
  
  def self.to_hash 
    [
    {
      'identifier' => 'years_of_publication',
      'values' =>
        [
          'All years',
          'Last 5 years',
          'More than 5 years ago'
        ],
      'form_input' => 'radio_buttons'
    },
    {
      'identifier' => 'client_groups',
      'values' =>
        [
          'Childrens (3-11)',
          'Young people (12 - 16)',
          'Parents / families',
          'Young adults (17 -24)',
          'Working age (18 - 65)',
          'Older people (65+)',
          'Over-indebted people',
          'Social housing tenants',
          'Teachers / practitioners',
          'Other'
        ],
      'form_input' => 'checkboxes'
    },
    {
      'identifier' => 'evidence_types',
      'values' =>
        [
          'Evaluation',
          'Insight',
          'Review'
        ],
      'form_input' => 'checkboxes'
    },
    {
      'identifier' => 'topics',
      'values' =>
        [
          'Pensions',
          'Pensions and Retirement Planning',
          'Credit Use and Debt',
          'Budgeting and keeping track',
          'Insurance and protection',
          'Financial Education',
          'Financial Capability'
        ],
      'form_input' => 'checkboxes'
    },
    {
      'identifier' => 'countries_of_delivery',
      'values' =>
        [
          'United Kingdom',
          'England',
          'Northern Ireland',
          'Scotland',
          'Wales',
          'USA',
          'Other'
        ],
      'form_input' => 'checkboxes'
    }
  ].freeze
end
end