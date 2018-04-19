Feature: Evidence Hub Search
	As a website user
	In order to see the evidence in the hub
	I want to be able to see a brief summary of all the insight summaries

  Scenario: Visit the landing page
    Given I visit the evidence hub search page
    Then I should see the "first" evidence summary as
      | Field               | Value                                                    |
      | document title      | Financial well-being: the employee view                  |
      | overview            | Stress caused by pay levels, lack of financial awareness |
      | evidence type       | Insight                                                  |
      | topics              | Saving                                                   |
      | countries           | United Kingdom                                           |
      | year of publication | 2015                                                     |
    And I should see the "second" evidence summary as
      | Field               | Value                                                                              |
      | document title      | Moving forward together: peer support for people with problem debt                 |
      | overview            | Research has found that there remains a real stigma around seeking advice for debt |
      | evidence type       | Insight                                                                            |
      | topics              | Credit Use and Debt                                                                |
      | countries           | England                                                                            |
      | year of publication | 2017                                                                               |

  Scenario: Search by keyword
    Given I visit the evidence hub search page
    When I search the evidence hub with a keyword "Financial well-being: the employee"
    Then I should see "1" evidence summary
    And I should see the "first" evidence summary as
      | Field               | Value                                                    |
      | document title      | Financial well-being: the employee view                  |
      | overview            | Stress caused by pay levels, lack of financial awareness |
      | evidence type       | Insight                                                  |
      | topics              | Saving                                                   |
      | countries           | United Kingdom                                           |
      | year of publication | 2015                                                     |

  Scenario: Search by keyword and filters
    Given I visit the evidence hub search page
    When I search the evidence hub with a keyword "Financial well-being: the employee"
    And I filter the search for the topic Saving
    Then I should see "1" evidence summary
    And I should see the "first" evidence summary as
      | Field               | Value                                                    |
      | document title      | Financial well-being: the employee view                  |
      | overview            | Stress caused by pay levels, lack of financial awareness |
      | evidence type       | Insight                                                  |
      | topics              | Saving                                                   |
      | countries           | United Kingdom                                           |
      | year of publication | 2015                                                     |

  Scenario: Clearing the filters for a filtered search
    Given I visit the evidence hub search page
    And I search based on some filters
    When I want to clear the filters
    Then I should see no filters checked

  Scenario: Clearing the filters for a filtered keyword search
    Given I visit the evidence hub search page
    And I search the evidence hub with a keyword "mortgage"
    And I search based on some filters
    When I want to clear the filters
    Then I should see no filters checked
    And I should see the keyword field cleared
