 Feature: Redirect
  As a user,
  I want to be able to visit an old page
  so that I have a good starting point for further information

  Scenario: Visiting an old site insight page
    Given I visit the page '/document/WOuEzCsAAIaQ8tXy/financial-well-being-the-employee-view'
    Then I should be reading the page '/en/insights/financial-well-being-the-employee-view'

  Scenario: Visiting an old site evaluation page
    Given I visit the page '/document/WOYJaysAADA42rIr/looking-after-the-pennies'
    Then I should be reading the page '/en/evaluations/looking-after-the-pennies'

  Scenario: Visiting an old site review page
    Given I visit the page '/document/WTVdRSkAAOsYaAQx/raising-household-saving'
    Then I should be reading the page '/en/reviews/raising-household-saving'

  Scenario: Visiting an old site vanity url
    Given I visit the page '/young-adults'
    Then I should be reading the page '/en/lifestages/young-adults'

  Scenario: Visiting an old site news page
    Given I visit the page '/en/news/old-news'
    Then I should be reading the page '/en/news/press-release-a-new-way-to-pay'
