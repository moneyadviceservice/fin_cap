Feature: Thematic Reviews Landing Page
  As a user
  I want to visit a central place for the thematic review evidence type
  so that I can gather the information I require


  Scenario: Thematic Reviews Landing Page
    Given I visit the thematic reviews landing page
    Then I should see the thematic reviews landing page content
    And I should see the "first" thematic review as
      | Field    | Value                                                       |
      | title    | How can we improve the financial capability of young adults |
      | overview | Some overview                                               |
    And I should see the "first" thematic review link
    And I should see the "second" thematic review as
      | Field    | Value                                                  |
      | title    | How can we iencourage people to save, and to save more |
      | overview | how-can-we-iencourage-people-to-save-and-to-save-more  |
    And I should see the "second" thematic review link
