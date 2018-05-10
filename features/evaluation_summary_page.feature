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
