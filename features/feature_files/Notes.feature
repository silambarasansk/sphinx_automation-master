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
    Given I am on the loan details page

  @CHAMP-21 @smoke
  Scenario: Verify addition of user notes in User notes section
    And I enter notes "Test Note" in the notes section
    When I close the notes section
    And I reopen the notes
    Then I should see the saved note "Test Note"

  @CHAMP-21 @smoke
  Scenario: Verify no user notes in User notes section
    And I see no notes
    When I close the notes section
    And I reopen the notes
    And I see no notes

  @CHAMP-968 @smoke
  Scenario: Verify placeholder for system notes section
    Given I should see the system generated notes placeholder
    And I see the system notes title as "System Generated Notes"
    When I close the notes section
    And I reopen the notes
    Then I should see the system generated notes placeholder

  @CHAMP-968 @smoke
  Scenario: Verify system notes section has generated note
    Then I should see the system generated notes placeholder
    Then I should see the saved system note
    When I close the notes section
    And I reopen the notes
    Then I should see the saved system note

  @CHAMP-21 @regression @smoke
  Scenario: Verify the Notes title and notes body watermark
    When I see the notes title as "Notes"
    Then I see "Enter your notes..." help in Notes body

  @CHAMP-21 @regression @smoke
  Scenario: Verify the Notes title and notes body watermark
    Given I click the call recap screen
    And I see the recap title as "USER NOTES"
    Then I see "Enter your notes..." help in Call recap screen

  @CHAMP-21 @smoke
  Scenario: Verify user note replication in call recap screen
    And I enter notes "Test Note" in the notes section
    When I close the notes section
    And I click the call recap screen
    Then I should see the saved note "Test Note" in the recap screen
    And I edit the notes to "Edited !@#$%^&*)({}][:<>,.?/Note"
    And I reopen the notes
    Then I should see the saved note "Edited !@#$%^&*)({}][:<>,.?/Note"

  @CHAMP-21 @CHAMP-968 @smoke
  Scenario: Verify system notes replication in the call recap screen
    Then I should see the saved system note
    And I click the call recap screen
    Then I see the call recap screen
    And I see the recap title as "SYSTEM GENERATED NOTES"
    Then I should see the saved system note in the recap screen