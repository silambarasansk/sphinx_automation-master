Feature: Skip and next functionality check

  Background:
    Given I have loan "807000"
    And I have the business process created as "process1"
    And I have the steps "step1" created for business process with order "1"
    And I have sections configured for steps as "section1" with order "1"

  @CHAMP-10 @smoke
  Scenario: Verify the multiple prompt answering without response and complete to call
    Given I have prompt configured as "prompt1" for section with order "1"
    And I have prompt configured as "prompt2" for section with order "2"
    Then I am in the Loan Search Page
    And I search for "807000"
    Then I select loan number "807000" from search result
    And I should see "Prompt1" title
    And I click on "Next" button
    Then I should see "Prompt2" title
    And I click on "Next" button
    And I see the call recap screen
    When I complete the call
    And I should see "CALL COMPLETED" title
    And I should see the "Copy to Clipboard" button
    Then I click on "Copy to Clipboard" button
    And I see the button text changed to "COPIED!"

  @CHAMP-10 @smoke
  Scenario: Verify the multiple prompt answering move back & forth without response and complete to call
    Given I have prompt configured as "prompt1" for section with order "1"
    And I have prompt configured as "prompt2" for section with order "2"
    Then I am in the Loan Search Page
    And I search for "807000"
    Then I select loan number "807000" from search result
    And I should see "Prompt1" title
    And I click on "Next" button
    Then I should see "Prompt2" title
    And I click on "Next" button
    And I see the call recap screen
    Then I click on "step1" button
    And I should not see the "Next" button
    And I should not see the "Skip Step" button
    When I complete the call
    And I should see "CALL COMPLETED" title
    And I should see the "Copy to Clipboard" button
    Then I click on "Copy to Clipboard" button
    And I see the button text changed to "COPIED!"

  @CHAMP-10 @smoke
  Scenario: Verify the multiple prompt answering move back & forth with response and complete to call
    Given I have prompt configured as "prompt1" for section with order "1"
    And I have "radiobutton" response "response1" configured for a prompt with order "1"
    And I have prompt configured as "prompt2" for section with order "2"
    And I have "radiobutton" response "response2" configured for a prompt with order "1"
    Then I am in the Loan Search Page
    And I search for "807000"
    Then I select loan number "807000" from search result
    And I should see "Prompt1" title
    Then I answer to the radiobutton response of "prompt1"
    Then I should see "Prompt2" title
    Then I answer to the radiobutton response of "prompt2"
    And I see the call recap screen
    Then I click on "step1" button
    And I should not see the "Next" button
    And I should not see the "Skip Step" button
    And I should see the responses captured
    When I complete the call
    And I should see "CALL COMPLETED" title
    And I should see the "Copy to Clipboard" button
    Then I click on "Copy to Clipboard" button
    And I see the button text changed to "COPIED!"


  @CHAMP-10 @smoke
  Scenario: Verify the alignment for single step process and steps with response(Full call flow till call recap)
    And I have prompt configured as "prompt1" for section with order "1"
    And I have "radiobutton" response "response1" configured for a prompt with order "1"
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    Then I see the configured steps
    And I see the prompt title
    And I see the configured responses
    Then I answer to the radiobutton response of "prompt1"
    And I see the call recap screen
    When I complete the call
    And I should see "CALL COMPLETED" title
    And I should see the "Copy to Clipboard" button
    Then I click on "Copy to Clipboard" button
    And I see the button text changed to "COPIED!"

  @CHAMP-10 @smoke
  Scenario: Verify the alignment for single step process and skip steps without response(Full call flow till call recap)
    And I have prompt configured as "prompt1" for section with order "1"
    And I have "radiobutton" response "response1" configured for a prompt with order "1"
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    Then I see the configured steps
    And I see the prompt title
    Then I click on "Skip Step" button
    And I see the call recap screen
    When I complete the call
    And I should see "CALL COMPLETED" title
    And I should see the "Copy to Clipboard" button
    Then I click on "Copy to Clipboard" button
    And I see the button text changed to "COPIED!"

  @CHAMP-10 @smoke
  Scenario: Verify the skip steps and move back to respond(skip->call recap->move back-> answer->call_recap for radiobutton response)
    And I have prompt configured as "prompt1" for section with order "1"
    And I have "radiobutton" response "response1" configured for a prompt with order "1"
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    Then I see the configured steps
    And I should see there are no responses captured
    Then I click on "Skip Step" button
    And I see the call recap screen
    Then I click on "step1" button
    And I should see there are no responses captured
    And I should see the "Skip Step" button
    Then I answer to the radiobutton response of "prompt1"
    And I see the call recap screen
    Then I click on "step1" button
    And I should see the responses captured
    And I should not see the "Next" button
    And I should not see the "Skip Step" button
    When I complete the call
    And I should see "CALL COMPLETED" title
    And I should see the "Copy to Clipboard" button
    Then I click on "Copy to Clipboard" button
    And I see the button text changed to "COPIED!"

  @CHAMP-10 @smoke
  Scenario: Verify the skip steps and move back to respond(skip->call recap->move back-> answer->call_recap for checkbox response)
    And I have prompt configured as "prompt1" for section with order "1"
    And I have "checkbox" response "response1" configured for a prompt with order "1"
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    Then I see the configured steps
    And I should see there are no responses captured
    And I should see the "Next" button disabled
    And I should see the "Skip Step" button
    Then I click on "Skip Step" button
    And I see the call recap screen
    Then I click on "step1" button
    And I should see there are no responses captured
    And I should see the "Skip Step" button
    And I should see the "Next" button disabled
    Then I answer to the checkbox response
    And I click on "Next" button
    And I see the call recap screen
    Then I click on "step1" button
    And I should see the responses captured
    And I should not see the "Next" button
    And I should not see the "Skip Step" button
    When I complete the call
    And I should see "CALL COMPLETED" title
    And I should see the "Copy to Clipboard" button
    Then I click on "Copy to Clipboard" button
    And I see the button text changed to "COPIED!"

  @CHAMP-10 @wip
  Scenario: Verify the skip steps and move back to respond(skip->call recap->move back-> answer->call_recap for dropdown response)
    And I have prompt configured as "prompt1" for section with order "1"
    And I have "dropdown" response "response1" configured for a prompt with order "1"
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    Then I see the configured steps
#    And I should see there are no responses captured
    And I should see the "Next" button disabled
    And I should see the "Skip Step" button
    Then I click on "Skip Step" button
    And I see the call recap screen
    Then I click on "step1" button
#    And I should see there are no responses captured
    And I should see the "Skip Step" button
    And I should see the "Next" button disabled
    Then I answer to the dropdown response
    And I click on "Next" button
    And I see the call recap screen
    Then I click on "step1" button
    And I should see the responses captured
    And I should not see the "Next" button
    And I should not see the "Skip Step" button
    When I complete the call
    And I should see "CALL COMPLETED" title
    And I should see the "Copy to Clipboard" button
    Then I click on "Copy to Clipboard" button
    And I see the button text changed to "COPIED!"

  @CHAMP-10 @smoke
  Scenario: Verify the skip steps and move back to respond(skip->call recap->move back-> answer->call_recap for text response)
    And I have prompt configured as "prompt1" for section with order "1"
    And I have text response "response1" configured for a prompt with order "1"
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    Then I see the configured steps
    And I should see there are no responses captured for text
    And I should see the "Next" button disabled
    And I should see the "Skip Step" button
    Then I click on "Skip Step" button
    And I see the call recap screen
    Then I click on "step1" button
    And I should see there are no responses captured for text
    And I should see the "Skip Step" button
    And I should see the "Next" button disabled
    Then I answer to the text box response as "trial text"
    And I click on "Next" button
    And I see the call recap screen
    Then I click on "step1" button
    And I should see the responses captured as "trial text"
    And I should not see the "Next" button
    And I should not see the "Skip Step" button
    When I complete the call
    And I should see "CALL COMPLETED" title
    And I should see the "Copy to Clipboard" button
    Then I click on "Copy to Clipboard" button
    And I see the button text changed to "COPIED!"

  @CHAMP-10 @smoke
  Scenario: Verify the skip steps and move back to respond(skip->call recap->move back-> answer->call_recap for phone response)
    And I have prompt configured as "prompt1" for section with order "1"
    And I have phone response "response1" configured for a prompt with order "1"
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    Then I see the configured steps
    And I should see there are no responses captured for text
    And I should see the "Next" button disabled
    And I should see the "Skip Step" button
    Then I click on "Skip Step" button
    And I see the call recap screen
    Then I click on "step1" button
    And I should see there are no responses captured for text
    And I should see the "Skip Step" button
    And I should see the "Next" button disabled
    Then I answer to the text box response as "1234567890"
    And I click on "Next" button
    And I see the call recap screen
    Then I click on "step1" button
    And I should see the responses captured as "(123)-456-7890"
    And I should not see the "Next" button
    And I should not see the "Skip Step" button
    When I complete the call
    And I should see "CALL COMPLETED" title
    And I should see the "Copy to Clipboard" button
    Then I click on "Copy to Clipboard" button
    And I see the button text changed to "COPIED!"

  @CHAMP-10 @smoke
  Scenario: Verify the skip steps and move back to respond(skip->call recap->move back-> answer->call_recap for extn response)
    And I have prompt configured as "prompt1" for section with order "1"
    And I have extension response "response1" configured for a prompt with order "1"
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    Then I see the configured steps
    And I should see there are no responses captured for text
    And I should see the "Next" button disabled
    And I should see the "Skip Step" button
    Then I click on "Skip Step" button
    And I see the call recap screen
    Then I click on "step1" button
    And I should see there are no responses captured for text
    And I should see the "Skip Step" button
    And I should see the "Next" button disabled
    Then I answer to the text box response as "1234567"
    And I click on "Next" button
    And I see the call recap screen
    Then I click on "step1" button
    And I should see the responses captured as "123-4567"
    And I should not see the "Next" button
    And I should not see the "Skip Step" button
    When I complete the call
    And I should see "CALL COMPLETED" title
    And I should see the "Copy to Clipboard" button
    Then I click on "Copy to Clipboard" button
    And I see the button text changed to "COPIED!"


  @CHAMP-10 @wip
  Scenario: Verify the sequence of prompts is displayed for the single step process as per order
    Given  I have the following prompts for "mrpc" step "section1" section:
      | uid     | title           | display_title        | order |
      | prompt1 | Question here   | Activity log title   | 1     |
      | prompt2 | Question 2 here | Activity 2 log title | 2     |
    And the sequence of prompts is:
      | Prompt text     |
      | Question Here   |
      | Question 2 Here |
      | Question 4 Here |
      | Question 3 Here |

  @CHAMP-10 @wip
  Scenario: Verify sequence of prompts are displayed in the all sections
    Given  I am in a section
    And Verify the single/sequence of prompts is displayed for a section
    Then I navigate to other sections
    And Verify the prompts are displayed in the other sections
    And Verify the prompts accepts special characters and rules

  @CHAMP-10 @wip
  Scenario: Verify the prompts is displayed when Mongodb is down
    Given  I am in a section
    And Verify the single/sequence of prompts is not displayed for a section

  #Feature: CHAMP-13 View responses without rules

  @CHAMP-13 @wip
  Scenario: Verify if I am able to the see the radio button as answer type with the label associated to the question
    Then I navigate to a step, section, prompt
    And I see a response tagged to the prompt
    And verify I see a radio button  with a label associated

  @CHAMP-13 @wip
  Scenario: Verify if I am able to the see the Checkbox as answer type with the label associated to the question
    Then I navigate to a step, section, prompt
    And I see a response tagged to the prompt
    And verify I see a Checkbox  with a label associated

  @CHAMP-13 @wip
  Scenario: Verify if I am able to the see the textbox as answer type with the label associated to the question
    Then I navigate to a step, section, prompt
    And I see a response tagged to the prompt
    And verify I see a textbox  with a label associated

  @CHAMP-13 @wip
  Scenario: Verify if I am able to the see the calendar as answer type with the label associated to the question
    Then I navigate to a step, section, prompt
    And I see a response tagged to the prompt
    And verify I see a calendar  with a label associated

  @CHAMP-13 @wip
  Scenario: Verify if I am able to the see the labels as answer type with the label associated to the question
    Then I navigate to a step, section, prompt
    And I see a response tagged to the prompt
    And verify I see a labels  with a label associated

  @CHAMP-13 @wip
  Scenario: Verify if I am able to the see the combination of textbox/checkbox/radio/calender/label button as answer type with the label associated to the question
    Then I navigate to a step, section, prompt
    And I see a response tagged to the prompt
    And verify I see a combinations of textbox/checkbox/radio/calender/label  with a label associated

  @CHAMP-13 @wip
  Scenario: Verify if I am able to the alignment of ttextbox/checkbox/radio/calender/label button as answer type with the label associated to the question
    Then I navigate to a step, section, prompt
    And I see a response tagged to the prompt
    And verify I see a combinations of textbox/checkbox/radio/calender/label  with a label associated and aligned correctly

#Feature: CHAMP-9 View all steps of a process

  @CHAMP-9 @wip
    #(e.g. “Payment Plan Change Pending” process has below Make RPC End Call)
  Scenario: Verify if I am able to see all the steps associated to that process / for that loan status
    Given I am starting with a process
    Then I see the steps associated with the process
    And verify if multiple steps are viewable for a process

  @CHAMP-9 @wip
  Scenario:Verify if steps associated are sequential in chevron view
    Given I am starting with a process
    Then I see the steps associated with the process in a chevron view

  @CHAMP-9 @wip
  Scenario:Verify if the steps/prompts/answers are viewable
    Given I am starting with a process
    Then I see the steps associated with the process
    And verify if prompts and answers associated to the step is visible
    And verify if I am able to move to other steps once answered

  #Feature: CHAMP-15 Answer the question

  @CHAMP-15 @wip
  Scenario: Verify if I am able to see the prompts sequenced and select Radio/Checkbox/input(text box) to enter the response
    Then I navigate to a step, section, prompt
    And I see a response tagged to the prompt
    When verify I see a combinations of textbox/checkbox/radio  with a label associated
    And verify I am able to input a response for the prompt

  @CHAMP-15 @wip
  Scenario: Verify if I am able to see the “next” button to move to next question/section as per rule
    Then I navigate to a step, section, prompt
    Then verify I am able to input a response for the prompt
    And verify if i see a next button
    Then click on the next button
    And verify it takes to the next prompt and next section

  @CHAMP-15 @wip
  Scenario:Verify if am able to change the response once answered
    Then I navigate to a step, section, prompt
    Then verify I am able to input a response for the prompt
    And verify I am able to change the response

  @CHAMP-15 @wip
  Scenario:Verify if I am able to view response triggers an response
    Then I navigate to a step, section, prompt
    Then verify I am able to input a response for the prompt
    And verify if an new response is triggered for an response
    And verify I am able to input a response for the prompt

  @CHAMP-15 @wip
  Scenario:Verify if I am able to view response and validate it against the Webservices
    Then I navigate to a step, section, prompt
    Then verify I am able to input a response for the prompt
    And Verify if the values matches against the Webservices

  @CHAMP-15 @wip
  Scenario: Verify if I am able to see the “skip” button to move to next step as per rule
    Then I navigate to a step, section, prompt
    Then verify I am able to input a response for the prompt
    And verify if i see a skip button
    Then click on the skip button
    And verify it takes to the next step annd the chevron color becomes orange
