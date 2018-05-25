Feature: Thematic Review Evidence Hub Search
  As a website user
  In order to see the summaries related to thematic reviews
  I want to be able to see a documents of all the thematic reviews

  Scenario:
    Given I entered into the Thematic review page "How can we improve the financial capability of young adults?"
    When I click "Evidence Summaries Associated with this Thematic Review"
    Then I should see the summaries related to "How can we improve the financial capability of young adults?"
