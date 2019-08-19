Feature: Cookie policy acceptance

  Scenario: Visiting the website for the first time
    Given I have not previously accepted the cookie policy
    And I visit the homepage
    Then I should see the cookie policy header
      | Field            | Value                                                                                                                               |
      | message_content  | We use Cookies: By using this website, you consent to their use. More details can be found in our cookies policy. Accept and close |
      | link_description | cookies policy                                                                                                        |
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
      | message_content  | We use Cookies: By using this website, you consent to their use. More details can be found in our cookies policy. Accept and close |
      | link_description | cookies policy                                                                                                        |
      | link_url         | /en/articles/cookies                                                                                                                |

  Scenario: Visiting the website after accepting the policy
    Given I have previously accepted the cookie policy
    And I visit the homepage
    Then I should not see the cookie policy header
