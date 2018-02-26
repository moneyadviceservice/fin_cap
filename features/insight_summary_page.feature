Feature: Evidence Hub: Insight Summary page
  As a fincap user
  I want to be taken to a page that contains all the information relating to insight summaries
  So that I can read, analyse and learn about the insight

  Scenario: Insight Page
    Given I entered into the Insight page "Financial well-being: the employee view"
    Then I should see the content
      | Field               | Content                                                  |
      | Evidence Type       | Insight                                                  |
      | Evidence Title      | Financial well-being: the employee view                  |
      | Content             | Stress caused by pay levels, lack of financial awareness |
      | Client group        | Over-indebted people                                     |
      | Topics              | Financial Capability                                     |
      | Topics              | Saving                                                   |
      | Year of publication | 2015                                                     |
      | Country             | United Kingdom                                           |
