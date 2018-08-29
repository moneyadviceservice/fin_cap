Feature: Evidence Hub: Evaluation Summary page
  As a fincap user
  I want to be taken to a page that contains all the information relating to insight summaries
  So that I can read, analyse and learn about the insight

  Scenario: Evaluation Page
    Given I entered into the "Evaluation" page "Looking after the pennies"
    Then I should see the evidence summary content
      | Field                  | Content                                               |
      | Evidence Type          | evaluation                                            |
      | Evidence Title         | Looking after the pennies                             |
      | Content                | trackers are all available as free smartphone apps    |
      | Client groups          | Working age (18 - 65)                                 |
      | Topics                 | Budgeting and keeping track                           |
      | Activities and setting | Comparison of budgeting apps vs. pen and paper methods|
      | Measured outcomes      | Financial capability (Mindset)                        |
      | Programme delivery     | Money Advice                                          |
      | Year of publication    | 2017                                                  |
      | Country                | United Kingdom                                        |
      | Contact information    | MASPD (in partnership with Company S.A)               |
      | Links                  | Looking after the pennies - full report               |
    And I should see an icon linking to "Evaluation" article
    And I should see the evidence summary data_types
      | Field                       | Value |
      | programme_theory            | cross |
      | measured_outcomes_checklist | tick  |
      | causality                   | cross |
      | process_evaluation          | cross |
      | value_for_money             | cross |

  Scenario: Key Info panel: Measured Outcome
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
