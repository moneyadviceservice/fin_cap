Feature: Lifestage page
  As a user,
  I want to be able to read a lifestage page and easily find related content,
  so that I can gather as much information as I require on this subject.

  Scenario: Visiting an Lifestage page
    Given I entered into the Lifestage page "Young Adults"
    Then I should see the lifestage title "Young Adults"
    And I should see the hero description "Research suggests that Young Adults typically display lower levels of financial capability than other age groups."
    And I should see the lifestage content
    """
    This is an example paragraph containing information about a specific lifestage.
    """
    And I should see the latest news box with "1" news items
    And I should see the news items details
      | title  | date                     | link            |
      | News 1 | Monday 19 November 2018  | /en/news/news-1 |
    And I should see the teaser boxes with
      | title                       | text                                              | link                               |
      | Some title to tease you     | Loads of content to make you read more            | /financial+capability+strategy.pdf |
      | Another title to entice you | A bunch of well written content to make you click | /financial+capability+strategy.pdf |
      | Teasing title               | You want to read this, you need to read this      | /financial+capability+strategy.pdf |
    And I should see the research box
    And I should see the strategy box with
      | title            | text                                         | link                               |
      | Strategy Title   | Adult financial capability is a direct resul | /financial+capability+strategy.pdf |
    And I should see the life stages box
    And I should see the steering group links
      | text                   | link                       |
      | Steering group members | /financial+capability+strategy.pdf |
      | Steering group updates | /financial+capability+strategy.pdf |
      | Action plans           | /financial+capability+strategy.pdf |
    And I should see the download links
      | text                        | link                               |
      | Lifestage category download | /financial+capability+strategy.pdf |
    And The "description" meta tag should be present
    And The "title" meta tag should be present
      