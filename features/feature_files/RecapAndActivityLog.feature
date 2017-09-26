Feature: Capture and view notes

  Background:
    Given I have loan "807000"
    And I have the business process created as "process1"
    And I have the steps "step1" created for business process with order "1"
    And I have sections configured for steps as "section1" with order "1"
    And I have prompt configured as "prompt1" for section with order "1"
    And I have "radiobutton" response "response1" configured for a prompt with order "1"
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    Then I am on the loan details page

  @CHAMP-25 @smoke
  Scenario: View call completion title, help
    When I complete the call
    And I should see "CALL COMPLETED" title
    Then I should see "Please copy the notes below into the reverse servicing application" help message
    And I should see the "Copy to Clipboard" button
    Then I click on "Copy to Clipboard" button
    And I see the button text changed to "COPIED!"
#    Then I should have the notes copied
#    And It should be pasted

  @CHAMP-25 @smoke
  Scenario: View call completion title, message
    And I enter notes "Test Note" in the notes section
    When I complete the call
    And I should see "CALL COMPLETED" title
    Then I should see the user notes "Test Note" and system notes are displayed together

  @CHAMP-25 @smoke
  Scenario: View call completion title, message
    And I enter notes "Test Note" in the notes section
    When I complete the call
    And I should see "CALL COMPLETED" title
    Then I should see the user notes "Test Note" and system notes are displayed together

  @CHAMP-25
  Scenario: View Sample entry for activity log
    Given I've filled the responses "Yes" and "Text Response"
    When I complete the call
    Then I am in the Loan Search Page
    And I re-search for the loan "807000"
    Then I should see the activity log entry:
    | Activity log title | Yes |
    | Activity log title-Text | Text Response |
    And I should see the following step names in the order
    |Make RPC  |
    And I should see the activity log sorted in reverse order of process

  Scenario: View entries for activity log is sorted based on time
    Given I've filled the responses "Yes" and "Text Response"
    When I complete the call
    And I re-search for the loan "807000"
    Then I've filled the responses "Yes" and "Text Response"
    When I complete the call
    Then I should see the activity log is sorted by time descending
