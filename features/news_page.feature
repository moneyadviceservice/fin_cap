Feature: News page
  As a user visiting the fincap website
  I should be able to read news content
  So that I can keep up to date with the latest information

  Scenario: Visiting an News page
    Given I entered into the News page "Press Release: A new way to pay!"
    Then I should see the news title "Press Release: A new way to pay!"
    And I should see the hero description "New strategy launched to make UK payments fit for the 21st Century"
    And I should see the order by date "Thursday 26 July 2018"
    And I should see the news content
    """
    The way in which payments are made in the UK is set to undergo the most radical change since the 1960s. This follows the launch of a new strategy to give people greater control over how they manage their day-to-day finances and help stamp out financial fraud.
    """
    And I should see the news call to action links
      | text       | link  | 
      | Latest news| /news |
