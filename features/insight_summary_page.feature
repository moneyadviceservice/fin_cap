Feature: Evidence Hub: Insight Summary page
  As a fincap user
  I want to be taken to a page that contains all the information relating to insight summaries
  So that I can read, analyse and learn about the insight

  Scenario: Insight Page
    Given I entered into the "Insight" page "Financial well-being: the employee view"
    Then I should see the evidence summary content
      | Field               | Content                                                  |
      | Evidence Type       | insight                                                  |
      | Evidence Title      | Financial well-being: the employee view                  |
      | Content             | Stress caused by pay levels, lack of financial awareness |
      | Client groups       | Over-indebted people                                     |
      | Topics              | Saving                                                   |
      | Year of publication | 2015                                                     |
      | Country             | United Kingdom                                           |
      | Contact information | MASPD (in partnership with Company S.A)                  |
      | Links               | Financial well-being: the employee view - full report    |
    And I should see an icon linking to "Insight" article
    And I should see the evidence summary data_types
      | Field        | Content |
      | qualitative  | tick    |
      | quantitative | cross   |
