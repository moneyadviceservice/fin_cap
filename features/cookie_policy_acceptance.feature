Feature: Cookie policy acceptance

  Scenario: Visiting the website for the first time
    Given I have not previously accepted the cookie policy
    And I visit the homepage
    Then I should see the cookie policy header
      | Field            | Value                                                                                                                               |
      | message_content  | We use cookies to ensure that you get the best possible experience. By continuing to use our website you are agreeing to their use. Find out more about cookies. |
      | link_description | Find out more about cookies.                                                                                                        |
      | link_url         | /en/articles/cookies                                                                                                                |

  Scenario: Visiting the website and accepting the policy
    Given I have not previously accepted the cookie policy
    And I visit the homepage
    When I accept the cookie policy
    Then I should not see the cookie policy header

  Scenario: Visiting the website subsequent times without accepting the policy
    Given I have not previously accepted the cookie policy
    And I visit the homepage
    When I reload the page
    Then I should see the cookie policy header
      | Field            | Value                                                                                                                               |
      | message_content  | We use cookies to ensure that you get the best possible experience. By continuing to use our website you are agreeing to their use. Find out more about cookies. |
      | link_description | Find out more about cookies.                                                                                                        |
      | link_url         | /en/articles/cookies                                                                                                                |

  Scenario: Visiting the website after accepting the policy
    Given I have previously accepted the cookie policy
    And I visit the homepage
    Then I should not see the cookie policy header
