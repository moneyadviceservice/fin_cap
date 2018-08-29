Feature: Homepage
  As a user,
  I want to be able to visit the fincap homepage
  so that I have a good starting point for further information

  Scenario: Visiting an Homepage
    Given I entered into the Homepage
    Then I should see the homepage title "Financial Capability"
    And I should see the hero description "Welcome to the Financial Capability website"
    And I should see the homepage content
    """
    Welcome to the Financial Capability website, which provides the latest updates on the
    development of the Financial Capability Strategy for the UK, as well as resources and
    practical tools to help share learning about what works.
    """
    And I should see the horizontal teaser box with
      | title                    | text                      | link value | href                               |
      | Horizontal teaser title  | Horizontal teaser content | Click here | /financial+capability+strategy.pdf |
    And I should see the teaser boxes with
      | title               | text                                 | link |
      | First teaser title  | A bunch of ipsem lorem               | /financial+capability+strategy.pdf    |
      | Second teaser title | Kitchen sink ipsem lorem text        | /financial+capability+strategy.pdf    |
      | Third teaser title  | I have run out of ipsem lorem ideas. | /financial+capability+strategy.pdf    |
    And I should see the countries box
    And I should see the life stages box
    And I should see the latest news box
    And I should see the call to action buttons
      | text                                       | link                              |
      | I am interested in research and evaluation | /en/articles/our-approach         |
      | I need help to manage my money             | https://moneyadviceservice.org.uk |

  Scenario: Call to Action buttons
    Given I entered into the Homepage
    When I click the "I am interested in research and evaluation" cta
    Then I should see the "our-approach" article
