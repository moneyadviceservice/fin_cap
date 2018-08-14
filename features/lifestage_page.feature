Feature: Lifestage page
  As a user, 
  I want to be able to read a lifestage page and easily find related content, 
  so that I can gather as much information as I require on this subject.

  Scenario: Visiting an Lifestage page
    Given I entered into the Lifestage page "Young Adults"
    Then I should see the lifestage title "Young Adults"
    And I should see the hero description "Research suggests that young adults typically display lower levels of financial capability than older age groups."
    And I should see the lifestage content
    """
    Between the ages of 16 to 18 and continuing into their mid-20’s, the 
    transition into independent living and the working environment is a 
    critical moment in a young adult’s life, presenting new challenges and 
    requiring financial decisions to be made that could have a major impact
    on their future adult lives.
    """
    And I should see the latest news box with "1" news items
    And I should see the news items details
      | title                            | date                  | link                                    |
      | Press Release: A new way to pay! | Thursday 26 July 2018 | /en/news/press-release-a-new-way-to-pay |
    And I should see the teaser boxes with
      | title                       | text                                              | link |
      | Some title to tease you     | Loads of content to make you read more            | /financial+capability+strategy.pdf    |
      | Another title to entice you | A bunch of well written content to make you click | /financial+capability+strategy.pdf    |
      | Teasing title               | You want to read this, you need to read this      | /financial+capability+strategy.pdf    |
    And I should see the research box
    And I should see the strategy box with
      | title            | text                                         | link                               |
      | Strategy extract | Adult financial capability is a direct resul | /financial+capability+strategy.pdf | 
    And I should see the life stages box
    And I should see the steering group links
      | text                   | link                               |
      | Steering group members | /financial+capability+strategy.pdf |
      | Steering group updates | /financial+capability+strategy.pdf |
      | Action plans           | /financial+capability+strategy.pdf |
    And I should see the download links
      | text                  | link                               |
      | Young Adults download | /financial+capability+strategy.pdf |
