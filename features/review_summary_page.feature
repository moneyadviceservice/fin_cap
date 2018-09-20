Feature: Evidence Hub: Review Summary page
  As a fincap user
  I want to be taken to a page that contains all the information relating to review summaries
  So that I can read, analyse and learn about the review

  Scenario: Review Page
    Given I entered into the "Review" page "Raising household saving"
    Then I should see the evidence summary content
      | Field               | Content                                |
      | Evidence Type       | review                                 |
      | Evidence Title      | Raising household saving               |
      | Content             | There is continuing concern in the UK  |
      | Client groups       | Children (3 - 11)                      |
      | Topics              | Saving                                 |
      | Topics              | Pensions and Retirement Planning       |
      | Topics              | Financial Education                    |
      | Year of publication | 2012                                   |
      | Country             | International review                   |
      | Contact information | John Smith                             |
      | Links               | Raising household saving - full report |
    And I should see an icon linking to "Review" article
    And I should see the evidence summary data_types
      | Field             | Content |
      | systematic_review | tick    |
      | literature_review | cross   |

    And The "description" meta tag should be present
    And The "title" meta tag should be present
