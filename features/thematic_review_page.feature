Feature: Thematic review page
  As a user visiting the fincap website
  I should be able to read a thematic review content
  So that I can be informed of the financial capability strategy

  Scenario: Visiting a thematic review page
    Given I entered into the Thematic review page "How can we improve the financial capability of young adults?"
    Then I should see the article title "How can we improve the financial capability of young adults?"
    And I should see the hero description "Financial capability across the UK"
    And I should see the article content
    """
    Thematic Review content
    """
    And I should see the latest news box with "3" news items
    And I should see the news items details
      | title                                                              | date | link                                                                           |
      | UK Strategy                                                        |      | /en/articles/uk-strategy                                                       |
      | Financial well-being: the employee view                            |      | /en/insights/financial-well-being-the-employee-view                            |
      | Moving forward together: peer support for people with problem debt |      | /en/insights/moving-forward-together-peer-support-for-people-with-problem-debt |
    And I should see the call to action box containing the links
      | text                                                    | link                                                                             |
      | Evidence Summaries Associated with this Thematic Review | /en/evidence_hub?tag=how-can-we-improve-the-financial-capability-of-young-adults |
      | All Evidence Summaries                                  | /en/evidence_hub |
    And I should see the download box containing the links
      | text                         | link                  |
      | Young Adults Thematic review | /financial+capability+strategy.pdf |
    And I should see the feedback box with the email "email@moneyadviceservice.org.uk"
