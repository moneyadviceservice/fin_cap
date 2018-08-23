Feature: Research and Evaluation
  As a fincap website user
  I want to be able to see all Research and Evaluation documents
  So that I can learn how Financial Capability is researched

  Scenario: Research Findings
    Given I entered a page which includes the R&E component
    Then I should see "2" links for "Research and findings"
      | Name              | Link                                           |
      | Existing Research | /en/articles/find-evidence                     |
      | Evidence hub      | /en/articles/financial-capability-evidence-hub |

  Scenario: Existing Evaluation
    Given I entered a page which includes the R&E component
    Then I should see "3" links for "Evaluate your programme"
      | Name                                   | Link                                                |
      | Evaluation toolkit                     | /en/articles/evaluation-toolkit-overview            |
      | IMPACT Principles                      | /en/impact-principles                               |
      | Outcomes Frameworks and question banks | /en/articles/outcomes-frameworks-and-question-banks |
