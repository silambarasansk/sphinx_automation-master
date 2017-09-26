Feature: CHAMP-41 - Associate contextual info for answers CHAMP-23 - View contextual info for answers

  Background:
   

  @CHAMP-41 @wip
  Scenario: Adding contextual info for a response
    Given I send and accept JSON
    When I send a POST request for "Contextual Info" with the following:
    Then show me the unparsed response
    Then get "$['id']" of the last object
    When I send a GET request on corresponding response with previous id
    And the JSON response should have "$.text" with the text ""

  @CHAMP-41 @wip
  Scenario: Verify if am able to update the contextual info added
    Given I send and accept JSON
    When I send a POST request for "Updated Contextual Info" with the following:
    Then show me the unparsed response
    And the JSON response should have "$.text" with the updated text ""

  @CHAMP-41 @wip
  Scenario: Verify if I am able to delete the contextual info which is already added
    Given I send and accept JSON
    When I send a POST request by deleting the contextual info with the following:
    Then show me the unparsed response
    And the JSON response should not show the contextual info for the corresponding response

  @CHAMP-41 @wip
  Scenario: Verify if am able to associate image, link and text for contextual info
    Given I send and accept JSON
    When I send a POST request for "Contextual Info" with the following:
    Then show me the unparsed response
    Then get "$['id']" of the last object
    When I send a GET request on corresponding response with previous id
    And the JSON response should have "$.text" with the image, link and text

  @CHAMP-23 @wip
  Scenario: Verifying contextual info for a response on mouse over "?" image
    When I click on a prompt
    Then I should see the responses under the prompt
    When I mouse over the "?" image for a response
    Then I should get the contextual info for the response

  @CHAMP-23 @wip
  Scenario: Verifying contextual info is getting disappear when moving mouse away from "?" image
    When I click on a prompt
    Then I should see the responses under the prompt
    When I mouse over the "?" image for a response
    Then I should get the contextual info for the response
    When I mouse over the "?" image for other response
    Then I should get the contextual info for the response and previous info should get disappear
#CHAMP-18 - Auto populate answers based on user input

  @CHAMP-18 @wip
  Scenario: Verify the Autopopulate response field
    Given I am in a section where Autopopulate field is there
    Then I enter all the required fields
    And I should see the autopopulated field should filled with a auto calculated value

  @CHAMP-18 @wip
  Scenario: Verify the Autopopulate response field is editable
    Given I am in a section where Autopopulate field is there
    Then I enter all the required fields
    And I should see the autopopulated field should filled with a auto calculated value
    Then I should modify the value in the autopopulated response field.
#CHAMP-42 - Configure rules based on data from RODS

  @CHAMP-42 @wip
  Scenario: Verify if I am able to configure rules based on data from RODS
    Given I send and accept JSON
    When I send a POST request with rules based on data from RODS with the following:
    Then show me the unparsed response
    Then get "$['id']" of the last object
    When I send a GET request on corresponding response with previous id
    Then I should see the rules are getting updated for a prompt/response

  @CHAMP-42 @wip
  Scenario: Verify if I am able to delete rule based on data from RODS
    Given I send and accept JSON
    When I send a POST request with rules based on data from RODS with the following:
    Then show me the unparsed response
    Then get "$['id']" of the last object
    When I send a GET request on corresponding response with previous id
    Then I should not see the deleted rules for a prompt/response

  @CHAMP-42 @wip
  Scenario: Verify if I am able to update existing rule based on data from RODS
    Given I send and accept JSON
    When I send a POST request with updated rule based on data from RODS with the following:
    Then show me the unparsed response
    Then get "$['id']" of the last object
    When I send a GET request on corresponding response with previous id
    Then I should see the updated rule for a prompt/response

  @CHAMP-44 @wip
  Scenario: Verify if I am able to configure rule based on data from system fields
    Given I send and accept JSON
    When I send a POST request with rules based on data from system fields with the following:
    Then show me the unparsed response
    Then get "$['id']" of the last object
    When I send a GET request on corresponding response with previous id
    Then I should see the rules are getting updated for a prompt/response

  @CHAMP-44 @wip
  Scenario: Verify if I am able to delete rule based on data from system fields
    Given I send and accept JSON
    When I send a POST request with rules based on data from system fields with the following:
    Then show me the unparsed response
    Then get "$['id']" of the last object
    When I send a GET request on corresponding response with previous id
    Then I should not see the deleted rules for a prompt/response

  @CHAMP-44 @wip
  Scenario: Verify if I am able to update rule based on data from system fields
    Given I send and accept JSON
    When I send a POST request with updated rule based on data from system fields with the following:
    Then show me the unparsed response
    Then get "$['id']" of the last object
    When I send a GET request on corresponding response with previous id
    Then I should see the updated rule for a prompt/response

  @CHAMP-14 @wip
  Scenario: View responses with rules
    Given I have response type configured and associated to a prompt
    When I answer the response with has rules associated to it
    Then I should see the other response based on the rule triigered by previous response

  #view related info-question
  @CHAMP-11 @wip
  Scenario: Verifying related info for a question
    Given I have a question which has related info
    When I click on a prompt
    Then I should see the related info associated to that question

  @CHAMP-11 @wip
  Scenario: Verifying related info for a question which doesn't have related info
    Given I have a question which doesn't have related info
    When I click on a prompt
    Then I should not see the related info associated to that question

  #view related info-question
  @CHAMP-11 @wip
  Scenario: Verifying a question which has related info consists of sharepoint link/image
    Given I have a question which has related info
    When I click on a prompt
    Then I should see the related info consists of sharepoint link/image associated to that question
    And sharepoint link should be clickable

  #Associate related information to questions
  @CHAMP-35 @wip
  Scenario: Adding related info for a question
    Given I send and accept JSON
    When I send a POST request with "related Info" for a prompt with the following:
    Then show me the unparsed response
    Then get "$['id']" of the last object
    When I send a GET request on corresponding response with previous id
    And the JSON response should have "$.text" with the text ""

  #Associate related information to questions
  @CHAMP-35 @wip
  Scenario: Verify if I am able to update the existing related info for a question
    Given I send and accept JSON
    When I send a POST request with "Updated related Info" for a question with the following:
    Then show me the unparsed response
    And the JSON response should have "$.text" with the updated text ""

  #Associate related information to questions
  @CHAMP-35 @wip
  Scenario: Verify if I am able to delete the existing related info for a question
    Given I send and accept JSON
    When I send a POST request by deleting the contextual info with the following:
    Then show me the unparsed response
    And the JSON response should not show the contextual info for the corresponding response

   #Associate related information to questions
  @CHAMP-35 @wip
  Scenario: Verify if am able to associate image and link for related info
    Given I send and accept JSON
    When I send a POST request with "related Info" for a question with the following:
    Then show me the unparsed response
    Then get "$['id']" of the last object
    When I send a GET request on corresponding response with previous id
    And the JSON response should have "$.text" with the image and link

   #Associate and view steps to a process
  @CHAMP-31 @wip
  Scenario: Verify the steps that are showing for a given loan status
    Given I am in Loan Search Page
    Then I Search for the loans and get into Loan details page
    Then I should see the steps associated to that particular loan status
      | loan_status                                                                        | steps                                                                              |
      | Payment Plan Change Pending                                                        | Make RPC,End Call                                                                  |
      | Refer for FCL: Non-completed Repairs, Refer for Foreclosure: Non-completed Repairs | Make RPC,Reason for Delinquency,Repairs,T&I Repayment,End Call                     |
      | Refer for FCL: Death, Refer for Foreclosure: Death, Called Due: Death              | Make RPC,Non-Borrowing Spouse,T&I Repayment,DAP Dates,Liquidation Options,End Call |
