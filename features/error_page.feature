Feature: Not found error page
  As a user,
  I want to be able to get a nice error message
  so that I can understand how to get back to the fincap site.

  Scenario: Visiting a page that does not exist
    Given I entered a page that does not exist
    Then I should see the error content
    """
    The page you were looking for doesn't exist.
    You may have mistyped the address or the page may have moved.
    Click here to be taken to the homepage.
    """
    And I should see the fincap logo linking to the homepage
