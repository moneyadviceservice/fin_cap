Feature: Impact Principles page
  As a user,
  I want to be able to visit the fincap Impact Principles page
  so that I understand the high level strategy

  Scenario: Visiting an Impact Principles
    Given I entered into the Impact Principles page
    Then I should see the hero description "IMPACT Principles"
    And I should see the call to action links
      | text                             | link                          |
      | UK Financial Capability Strategy | /en/uk_strategies/uk-strategy |

  Scenario: Call to Action buttons
    Given I entered into the Impact Principles page
    When I click the "UK Financial Capability Strategy" cta
    Then I should see the "Uk Strategy" page
