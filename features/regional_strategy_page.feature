Feature: Regional Strategy page
  As a user, 
  I want to be able to read a regional strategy page and easily find related content, 
  so that I can gather as much information as I require on this subject.

  Scenario: Visiting an Regional Strategy page
    Given I entered into the Regional Strategy page "Wales"
    Then I should see the regional strategy title "Wales"
    And I should see the regional strategy description
    """
    The Welsh Government has long recognised that financial exclusion 
    and over-indebtedness are issues that need concerted action
    """
    And I should see the regional strategy content
    """
    The usually resident population of Wales was 3.1 million people living in 1.3 million households in 2011, with nearly one in five of residents aged 65 or over. Wales had a higher percentage of residents with a long-term health problem or disability. One in four of those aged 16 and over reported having no recognised qualification. There are 700,000 people in poverty in Wales, equivalent to 23 per cent of the population.
    """
    And I should see the latest news box
    And I should see the teaser boxes with
      | title                     | text                                                                                                                        | link |
      | Child Poverty Strategy    | New objectives for improving the outcomes of children and young people living in low income households.                     | /financial+capability+strategy.pdf    |
      | Strategy for Older People | Delivery Action Plan for Living Longer, Living Better focuses on the three priorities for the Strategy for Older People.    | /financial+capability+strategy.pdf    |
      | Warm Homes programme      | The government has made considerable investment to address home energy efficiency in low income communities and households. | /financial+capability+strategy.pdf    |
    And I should see the research box
    And I should see the strategy box with
      | title                               | text                                                                    | link                               |
      | Wales Financial Capability Strategy | There is general agreement that there should be one Strategy for Wales. | /financial+capability+strategy.pdf | 
    And I should see the countries box
    And I should see the download links
      | text                  | link                               |
      | Young Adults download | /financial+capability+strategy.pdf |
