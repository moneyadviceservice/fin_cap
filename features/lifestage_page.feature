Feature: Lifestage page
  As a user, 
  I want to be able to read a lifestage page and easily find related content, 
  so that I can gather as much information as I require on this subject.

  Scenario: Visiting an Lifestage page
    Given I entered into the Lifestage page "Young Adults"
    Then I should see the lifestage title "Young Adults"
    And I should see the lifestage description
    """
    Research suggests that young adults typically display
    lower levels of financial capability than older age groups.
    """
    And I should see the lifestage content
    """
    Young adults, as they leave school or other statutory settings, will face major changes in the coming years to the policy, economic and social landscape within which they will start managing money day to day and making critical financial decisions about their future. The degree of financial capability they display during this transition can have a major bearing on their resilience and wellbeing throughout their adult lives.
    """
    And I should see the latest news box
    And I should see the teaser boxes with
      | image                              | title                       | text                                              | link |
      | /assets/styleguide/hero-sample.jpg | Some title to tease you     | Loads of content to make you read more            | #    |
      | /assets/styleguide/hero-sample.jpg | Another title to entice you | A bunch of well written content to make you click | #    |
      | /assets/styleguide/hero-sample.jpg | Teasing title               | You want to read this, you need to read this      | #    |
    And I should see the research box
    And I should see the strategy box with
      | title            | text                                                     | link                               |
      | Strategy extract | Young adults in the coming years will face major changes | /financial+capability+strategy.pdf | 
    And I should see the lifestages box
    And I should see the steering group links
      | text                   | link                               |
      | Steering group members | /financial+capability+strategy.pdf |
      | Steering group updates | /financial+capability+strategy.pdf |
      | Action plans           | /financial+capability+strategy.pdf |
    And I should see the lifestage download links
      | text                  | link                               |
      | Young Adults download | /financial+capability+strategy.pdf |
      