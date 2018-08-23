Feature: Lifestage
  As a fincap website user
  I want to be able to see a summary of all lifestages
  So that I can learn about the issues relevant to different lifestages

  Scenario: Visiting a page with the component
    Given I entered a page which includes the lifestage component
    Then I should see each lifestage with a link to its page
      | Name                             | Link                                         |
      | Children and young people        | /en/lifestages/children-and-young-people     |
      | Young adults                     | /en/lifestages/young-adults                  |
      | Working age adults               | /en/lifestages/working-age                   |
      | People planning to retire        | /en/lifestages/retirement-planning           |
      | Older people in retirement       | /en/lifestages/people-retirement             |
      | People in financial difficulties | /en/lifestages/people-financial-difficulties |
      | People trying to save            | /en/lifestages/people-trying-save            |

  Scenario: Links
    Given I entered a page which includes the lifestage component
    When I click on "Young adults" in the lifestage component
    Then I should see the "Young Adults" page
