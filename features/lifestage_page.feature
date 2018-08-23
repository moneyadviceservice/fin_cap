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
    Young adults are those who have left compulsory education or other statutory settings,
    such as care. They are transitioning towards independent living and financial independence,
    beginning between the ages of 16 to 18 and continuing to their mid-20s.
    """
    And I should see the latest news box with "1" news items
    And I should see the news items details
      | title                            | date                  | link                                    |
      | Press Release: A new way to pay! | Thursday 26 July 2018 | /en/news/press-release-a-new-way-to-pay |
    And I should see the teaser boxes with
      | title          | text                                                                                                              | link                    |
      | Teaser 3 title | Research suggests that young adults typically display lower levels of financial capability than older age groups. | /exectutive+summary.pdf |
      | Teaser 3 title | Research suggests that young adults typically display lower levels of financial capability than older age groups. | /exectutive+summary.pdf |
      | Teaser 3 title | Research suggests that young adults typically display lower levels of financial capability than older age groups. | /exectutive+summary.pdf |
    And I should see the research box
    And I should see the strategy box with
      | title            | text                                         | link                               |
      | Strategy title   | Research suggests that young adults typically display lower levels of financial capability than older age groups. | /exectutive+summary.pdf | 
    And I should see the life stages box
    And I should see the steering group links
      | text                | link                       |
      | Evidence Hub        | /general_info              |
      | Evaluation Toolkit  | /common-evaluation-toolkit |
      | The Steering Groups | /steering-groups           |
    And I should see the download links
      | text         | link          |
      | Evidence Hub | /general_info |
