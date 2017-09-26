Feature: View the various responses

  Background:
    Given I have loan "807000"
    And I have the business process created as "process1"
    And I have the steps "step1" created for business process with order "1"
    And I have sections configured for steps as "section1" with order "1"
    And I have prompt configured as "prompt1" for section with order "1"

  @CHAMP-10 @smoke
  Scenario: Verify the radiobutton response
    And I have "radiobutton" response "response1" configured for a prompt with order "1"
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    Then I see the configured steps
    And I see the configured responses
    Then I answer to the radiobutton response of "prompt1"
    And I should not see the "Next" button
