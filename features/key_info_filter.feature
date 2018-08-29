Feature: Evidence Summary Page: Key Info filters
  As a fincap website user visiting an evidence summary
  I want to be able to find all related summaries
  So that I can read, analyse and learn about the related themes

  Scenario: Client Group
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
    And I should see the "Client group" "Over-indebted people" filter checked
