Feature: Countries
  As a fincap website
  I want to be able to see a summary of the strategies across the UK
  So that I can read the strategies of the devolved nations

  Scenario: Visiting a page with the component
    Given I entered a page which includes the countries component
    Then I should see each country with a link to its page
      | Name                          | Link                                     |
      | Strategy for United Kingdom   | /en/uk_strategies/uk-strategy            |
      | Strategy for Northern Ireland | /en/regional_strategies/northern-ireland |
      | Strategy for Scotland         | /en/regional_strategies/scotland         |
      | Strategy for Wales            | /en/regional_strategies/wales            |

  Scenario: Links - Regional Strategies
    Given I entered a page which includes the countries component
    When I click on "Northern Ireland" in the countries component
    Then I should see the "Northern Ireland" page

  Scenario: Links - United Kingdom
    Given I entered a page which includes the countries component
    When I click on "United Kingdom" in the countries component
    Then I should see the "Uk Strategy" page
