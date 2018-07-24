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
      | First teaser title  | A bunch of ipsem lorem               | #    |
      | Second teaser title | Kitchen sink ipsem lorem text        | #    |
      | Third teaser title  | I have run out of ipsem lorem ideas. | #    |
    And I should see the countries box
    And I should see the lifestages box
    And I should see the latest news box
    And I should see the download links
      | text                          | link                               |
      | Financial capability document | /financial+capability+strategy.pdf |
