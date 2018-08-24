Feature: UK Strategy page
  As a user,
  I need to be able to visit a landing page relating to the UK only,
  so that I can get information relating to where I live.

Scenario: Visiting a UK Strategy Page
  Given I entered into the UK Strategy page "UK Strategy"
  Then I should see the UK Strategy title "UK Strategy"
  And I should see the UK Strategy description
  """
  In the UK: four out of ten of us can’t manage our money around 16 million working age people have less than £300 in savings eight million of us are in serious debt These are the problems the Financial Capability Strategy sets out to fix
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
    | text     | link                               |
    | download | /financial+capability+strategy.pdf |

