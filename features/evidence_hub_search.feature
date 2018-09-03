Feature: Evidence Hub Search
	As a website user
	In order to see the evidence in the hub
	I want to be able to see a brief summary of all the insight summaries

  Background:
    Given I visit the evidence hub search page

  Scenario: Visit the landing page
    Then I should see a list of all search filters
      | Field               | Value                                                        |
      | Year of publication | All years, Last 2 years, Last 5 years, More than 5 years ago |
      | Client group        | Children (3 - 11), Young people (12 - 16), Parents / families, Young adults (17 - 24), Working age (18 - 65), Older people (65+), Over-indebted people, Social housing tenants, Teachers / practitioners, Other |
      | Topic               | Saving, Pensions and retirement planning, Credit use and debt, Budgeting and keeping track, Insurance and protection, Financial education, Financial capability |
      | Country of delivery | United Kingdom, England, Northern Ireland, Scotland, Wales, USA, Other |
    
    And I should see the "first" evidence summary as
      | Field               | Value                                                    |
      | document title      | Financial well-being: the employee view                  |
      | overview            | Stress caused by pay levels, lack of financial awareness |
      | evidence type       | Insight                                                  |
      | topics              | Saving                                                   |
      | countries           | United Kingdom                                           |
      | year of publication | 2015                                                     |
    And I should see the "first" evidence summary icon linking to "Insight" article
    And I should see the "first" evidence summary with data types as
      | Field         | Value |
      | qualitative   | tick  |
      | quantitative  | cross |
    And I should see the "second" evidence summary as
      | Field               | Value                                                                              |
      | document title      | Moving forward together: peer support for people with problem debt                 |
      | overview            | Research has found that there remains a real stigma around seeking advice for debt |
      | evidence type       | Insight                                                                            |
      | topics              | Credit Use and Debt                                                                |
      | countries           | England                                                                            |
      | year of publication | 2017                                                                               |
    And I should see the "second" evidence summary icon linking to "Insight" article
    And I should see the "second" evidence summary with data types as
      | Field         | Value |
      | qualitative   | cross |
      | quantitative  | cross |

  Scenario: Search by keyword
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
    And I should see the "first" evidence summary icon linking to "Insight" article
    And I should see the "first" evidence summary with data types as
      | Field         | Value |
      | qualitative   | tick  |
      | quantitative  | cross |

  Scenario: Search by keyword and filters
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
    And I should see the "first" evidence summary icon linking to "Insight" article

  Scenario: Search by Year of Publication filter
    When I search the evidence hub for summaries published in the last 2 years
    Then I should see "2" evidence summary
    And I should see the "first" evidence summary as
      | Field               | Value                                                              |
      | document title      | Moving forward together: peer support for people with problem debt |
      | evidence type       | Insight                                                            |
      | topics              | Credit Use and Debt                                                |
      | countries           | England                                                            |
      | year of publication | 2017                                                               |
    And I should see the "first" evidence summary icon linking to "Insight" article

  Scenario: Clearing the filters for a filtered search
    Given I search based on some filters
    When I want to clear the filters
    Then I should see no filters checked

  Scenario: Clearing the filters for a filtered keyword search
    Given I search the evidence hub with a keyword "mortgage"
    And I search based on some filters
    When I want to clear the filters
    Then I should see no filters checked
    And I should see the keyword field cleared

  Scenario: First page sending per page
    Given I am on the page "1" seeing "1" evidence summary per page
    Then I should see "1" evidence summary
    And I should see the "first" evidence summary as
      | Field               | Value                                                    |
      | document title      | Financial well-being: the employee view                  |
      | overview            | Stress caused by pay levels, lack of financial awareness |
      | evidence type       | Insight                                                  |
      | topics              | Saving                                                   |
      | countries           | United Kingdom                                           |
    And I should see an icon linking to "Insight" article

  Scenario: Going to the next page
    Given I am on the page "1" seeing "1" evidence summary per page
    When I go to the next evidence hub page
    Then I should see "1" evidence summary
    And I should see the "first" evidence summary as
      | Field               | Value                                                                              |
      | document title      | Moving forward together: peer support for people with problem debt                 |
      | overview            | Research has found that there remains a real stigma around seeking advice for debt |
      | evidence type       | Insight                                                                            |
      | topics              | Credit Use and Debt                                                                |
      | countries           | England                                                                            |
      | year of publication | 2017                                                                               |
    And I should see the "first" evidence summary icon linking to "Insight" article

  Scenario: Return to the previous page
    Given I am on the page "2" seeing "1" evidence summary per page
    When I go to the previous evidence hub page
    Then I should see "1" evidence summary
    And I should see the "first" evidence summary as
      | Field               | Value                                                    |
      | document title      | Financial well-being: the employee view                  |
      | overview            | Stress caused by pay levels, lack of financial awareness |
      | evidence type       | Insight                                                  |
      | topics              | Saving                                                   |
      | countries           | United Kingdom                                           |
    And I should see the "first" evidence summary icon linking to "Insight" article
