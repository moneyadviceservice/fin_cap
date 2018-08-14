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
    And I should see the evidence summary data_types
      | Field        | Content |
      | qualitative  | tick    |
      | quantitative | cross   |

  Scenario: Key Info client_group filters
    Given I entered into the "Insight" page "Financial well-being: the employee view"
    When I click on the "Over-indebted people" client group in the key info panel
    Then I should return to the search results page
    And I should see "2" evidence summaries
    And I should see the "first" evidence summary as
      | Field               | Value                                   |
      | document title      | Financial well-being: the employee view |
      | evidence type       | Insight                                 |
      | topics              | Topics: Saving, Financial Capability    |
      | countries           | United Kingdom                          |
      | year of publication | 2015                                    |
    And I should see the "second" evidence summary as
      | Field               | Value                                                              |
      | document title      | Moving forward together: peer support for people with problem debt |
      | evidence type       | Insight                                                            |
      | topics              | Credit Use and Debt                                                |
      | countries           | England                                                            |
      | year of publication | 2017                                                               |
  
  Scenario: Key Info topic filters
    Given I entered into the "Insight" page "Financial well-being: the employee view"
    When I click on the "Saving" topic in the key info panel
    Then I should return to the search results page
    And I should see "2" evidence summaries
    And I should see the "first" evidence summary as
      | Field               | Value                                   |
      | document title      | Financial well-being: the employee view |
      | evidence type       | Insight                                 |
      | topics              | Topics: Saving, Financial Capability    |
      | countries           | United Kingdom                          |
      | year of publication | 2015                                    |
    And I should see the "second" evidence summary as
      | Field               | Value                                                                 |
      | document title      | Raising household saving                                              |
      | evidence type       | Review                                                                |
      | topics              | Topics: Saving, Pensions and Retirement Planning, Financial Education |
      | countries           | International review                                                  |
      | year of publication | 2012                                                                  |
