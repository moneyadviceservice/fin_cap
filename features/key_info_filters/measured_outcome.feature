Feature: Key Info filters: Measured outcome
  As a fincap website user visiting an evidence summary
  I want to be able to find all related summaries
  So that I can read, analyse and learn about the related themes

Scenario: Measured Outcome
  Given I entered into the "Evaluation" page "Looking after the pennies"
  When I click on the "Financial capability (Mindset)" measured outcome in the key info panel
  Then I should return to the search results page
  And I should see "1" evidence summaries
  And I should see the "first" evidence summary as
    | Field               | Value                               |
    | document title      | Looking after the pennies           |
    | evidence type       | Evaluation                          |
    | topics              | Topics: Budgeting and keeping track |
    | countries           | United Kingdom                      |
    | year of publication | 2017                                |
