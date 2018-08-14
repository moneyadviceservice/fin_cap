Feature: UK Strategy page
  As a user,
  I need to be able to visit a landing page relating to the UK only,
  so that I can get information relating to where I live.

Scenario: Visiting a UK Strategy Page
  Given I entered into the UK Strategy page "UK Strategy"
  Then I should see the UK Strategy title "UK Strategy"
  And I should see the UK Strategy description
  """
  Financial capability across the UK
  """
  And I should see the UK Strategy content
  """
  This Strategy aims to improve financial capability across the UK.
  That means improving people’s ability to manage money well,
  both day to day and through significant life events, and their ability
  to handle periods of financial difficulty. It will focus on developing
  people’s financial skills and knowledge, and improving their attitudes
  and motivation. This, combined with an inclusive financial system,
  can help people achieve the best possible financial wellbeing.
  """
  And I should see the latest news box
  And I should see the countries box
  And I should see the life stages box
  And I should see the download links
    | text                                      | link                               |
    | UK Strategy                               | /financial+capability+strategy.pdf |
    | UK Detailed Strategy                      | /detailed-strategy.pdf             |
    | Key statistics on Financial Capability    | /key-statistics.pdf                |
    | Financial Capability Progress Report 2017 | /fincap+progress+report+2017.pdf   |
