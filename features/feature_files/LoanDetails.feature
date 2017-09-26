Feature: View Loan details

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

  @CHAMP-5 @loan @smoke
  Scenario: Verify returning to home page from loan details page
    Given I am on the loan details page
    Then I should see information about the loan
    And I click on mr.cooper icon to return back to home page
    And I should be on the base page

  @CHAMP-5 @loan @smoke
  Scenario: Verify loan details in left pane of the page
    Then I am on the loan details page
    Then I should see information about the loan
    When I close "LOAN INFORMATION" tab
    And I should see Borrower Information
    And I should see property information
    And I should see mailing information
    And I should see alternate contacts information
    And I should see Non borrower spouse information

  @CHAMP-5 @loan @regression
  Scenario: Verify Total Loss, Potential Incentive Amount is hidden on High Risk is 'N' and loan in foreclosure status
    Given I have loan "807000" with high risk indicator as "N"
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    Then I am on the loan details page
    And I should see the red highlight for foreclosure status
    And I should see Total loss, Potential incentive amount is hidden if High risk indicator is N

  @CHAMP-5 @loan @regression
  Scenario: Verify slider close and expand on loan details and verify fields
    Given I am on the loan details page
    Then I should see information about the loan
    When I close the slider
    Then I should not see the loan details page
    When I open the slider
    Then I should see information about the loan
