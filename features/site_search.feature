Feature: Site search
  As a fincap web site user
  I need to be able to use the in site search (either at the top or the bottom of the page)
  so that I can go straight to the content I require

  Background:
    Given I entered into the Homepage

  Scenario: Search a topic on the top search bar
    When I search the query "the employee view" on top bar
    Then I should see the search results
      | title                                   |
      | Financial well-being: the employee view |

  Scenario: Search a topic on the bottom search bar
    When I search the query "well-being" on bottom bar
    Then I should see the search results
      | title                                   |
      | Financial well-being: the employee view |
      | Financial Capability                    |
      | UK Strategy                             |

  Scenario: Search with paginated results - first page
    When I search the query "lifestage" on top bar
    Then I should see "10" results
    And I should see the search results
      | title                     |
      | Young Adults              |
      | Working Age Adults        |
      | People trying to save     |
      | People planning to retire |
    And I should be on page "1" of "2" of the search results
    And I should not see the "previous" button

  Scenario: Search with paginated results - second and last page
    When I search the query "lifestage" on top bar
    And I click on the "next" button
    Then I should see "2" results
    And I should see the search results
      | title                       |
      | Older People in Retirement  |
      | Children and Young People   |
    And I should be on page "2" of "2" of the search results
    And I should not see the "next" button

  Scenario: Search pages with description
    When I search the query "Financial" on top bar
    Then I should see "7" results
    And I should see the search results
      | title                      |
      | Financial well-being: the employee view |
    And I should see the description
       | This is an example description about a specific evidence summary. |

  Scenario: Search with no results
    When I search the query "Norris" on bottom bar
    Then I should see no search results for "Norris"