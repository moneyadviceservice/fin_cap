Feature: Latest News Page
  As a user
  I want to visit a central place for news
  so that I can gather the information I require

  Scenario: Latest News Page
    Given I visit the latest news page
    And I should see the latest news main description "Latest News"
    And I should see the latest news content
    """
    Here you will find all the latest news and press releases relating to the Financial Capability Strategy for the UK.
    Our research enables us to give people the best advice on understanding financial matters and making choices when managing money. Visit our corporate site for all our latest Research Reports.
    Or, for a wide range of evaluation evidence, insight and market research don’t forget to visit the new and improved Financial Capability Evidence Hub.
    """
    Then I should see a list of all news article titles and dates
      | Date                  | Title                            |
      | Thursday 26 July 2018 | Press Release: A new way to pay! |
      
    And I should see a link to the "first" news list item
     | Path                                   |
     | /en/news/press-release-a-new-way-to-pay |
