Feature: Article page
  As a user visiting the fincap website
  I should be able to read article content
  So that I can be informed of the financial capability strategy

  Scenario: Visiting an article page
    Given I entered into the Article page "UK Strategy"
    Then I should see the article title "UK Strategy"
    And I should see the hero description "Financial capability across the UK"
    And I should see the article content
    """
    This Strategy aims to improve financial capability across the UK.
    That means improving people’s ability to manage money well, both day to
    day and through significant life events, and their ability to handle
    periods of financial difficulty. It will focus on developing people’s
    financial skills and knowledge, and improving their attitudes and
    motivation.
    """
    And I should see the download box containing the links
      | text                                      | link                               |
      | UK Strategy                               | /financial+capability+strategy.pdf |
      | UK Detailed Strategy                      | /detailed-strategy.pdf             |
      | Key statistics on Financial Capability    | /key-statistics.pdf                |
      | Financial Capability Progress Report 2017 | /fincap+progress+report+2017.pdf   |
    And I should see the call to action box containing the links
      | text                             | link                         |
      | Evidence Hub                     | /general_info                |
      | Evaluation Toolkit               | /common-evaluation-toolkit   |
      | The Steering Groups              | /steering-groups             |
      | 2015 Financial Capability Survey | /financial-capability-survey |
    And I should see the feedback box with the email "email@moneyadviceservice.org.uk"
