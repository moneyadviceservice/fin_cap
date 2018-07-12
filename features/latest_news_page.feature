Feature: Latest News Page
  As a user
  I want to visit a central place for news
  so that I can gather the information I require

  Scenario: Latest News Page
    Given I visit the latest news page
    Then I should see the latest news main description "Latest News"
    And I should see the latest news content
    """
    Here you will find all the latest news and press releases relating to the Financial Capability Strategy for the UK.
    Our research enables us to give people the best advice on understanding financial matters and making choices when managing money. Visit our corporate site for all our latest Research Reports.
    Or, for a wide range of evaluation evidence, insight and market research don’t forget to visit the new and improved Financial Capability Evidence Hub.
    """
    And I should see a list of all news article titles and dates
      | Date                    | Title                             |
      | Thursday 26 July 2018   | Press Release: A new way to pay!  |
      | Wednesday 15 March 2017 | Scottish Financial Education Week |
      
    And I should see a link to the "first" news item
     | Path                                    |
     | /en/news/press-release-a-new-way-to-pay |

    And I should see a link to the "second" news item
     | Path                                       |
     | /en/news/scottish-financial-education-week |

    And I should see the articles ordered by most recently published

    And I should see links to previous years' news
     | Text     | Path               |
     | All news | /en/news           |
     | 2018     | /en/news?year=2018 |
     | 2017     | /en/news?year=2017 |
     | 2016     | /en/news?year=2016 |
     | 2015     | /en/news?year=2015 |
     | 2014     | /en/news?year=2014 |

  Scenario: News Page for Year
    Given I visit the latest news page
    When I click the "2017" link
    Then I should only see news article from "2017"
      | Date                    | Title                             |
      | Wednesday 15 March 2017 | Scottish Financial Education Week |

