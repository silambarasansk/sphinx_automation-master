Feature: View the prompts CHAMP-10

  Background:
    Given I have loan "807000"
    And I have the business process created as "process1"
    And I have the steps "step1" created for business process with order "1"
    And I have sections configured for steps as "section1" with order "1"

  @CHAMP-10 @smoke
  Scenario: Verify the multiple prompt is displayed
    Given I have prompt configured as "prompt1" for section with order "1"
    And I have prompt configured as "prompt2" for section with order "2"
    Then I am in the Loan Search Page
    And I search for "807000"
    Then I select loan number "807000" from search result
    And I see the prompt title
    Then I see the prompt text
    And I see the related information with title as "RELATED INFORMATION"
    Then I see the related information content
    And I click on "Next" button
    Then I should see "Prompt2" title

  @CHAMP-10 @smoke
  Scenario: Verify the prompt is displayed
    Given I have prompt configured as "prompt1" for section with order "1"
    Then I am in the Loan Search Page
    And I search for "807000"
    Then I select loan number "807000" from search result
    And I see the prompt title
    Then I see the prompt text
    And I see the related information with title as "RELATED INFORMATION"
    Then I see the related information content

  @CHAMP-785 @regression @smoke
  Scenario: Verify the prompt text with rods value[Text, Date, Number, Date, Empty string]
    Given I have prompt configured with rods value in prompt text
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value
  @CHAMP-666 @regression @smoke @email
  Scenario: Verify the prompt text with email integration[Valid email]
    Given I have prompt configured with email content in prompt text
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text as link with email content

  @CHAMP-666 @regression @smoke @email
  Scenario: Verify the prompt text with email integration[To field with float/Alphanumeric values]
    Given I have prompt configured with email content with float/alphanumeric value in prompt text
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text as link with email content

  @CHAMP-666 @regression @smoke @email
  Scenario: Verify the prompt text with rods data[Text, Date, Number, Date, Empty string] for email integration
    Given I have prompt configured with rods data email id in prompt text
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text as link with email content including rods value

  @CHAMP-791 @regression @smoke @email
  Scenario: Verify the prompt text with rods data email id with spaces in 'To' field
    Given I have prompt configured with rods data email id with spaces in prompt text
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text as link with email content with no spaces

  @CHAMP-791 @regression @smoke @email
  Scenario: Verify the prompt text with rods data email id with float values in 'To' field
    Given I have prompt configured with rods data email id with float values in prompt text
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text as link with email content with float values

  @CHAMP-791 @regression @smoke @email
  Scenario: Verify the prompt text with Empty rods data email id
    Given I have prompt configured with Empty rods data email id in prompt text
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text as link with email content with no mail id

  @CHAMP-791 @regression @smoke @email
  Scenario: Verify the prompt text with NULL rods data email id
    Given I have prompt configured with null rods data email id in prompt text
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text as link with email content with no mail id




  @CHAMP-10 @wip
  Scenario: Verify the alignment for single step process and steps with sections
    Then I see the process, steps, sections and prompts in hierarchial order
    And verify the prompt is available

  @CHAMP-10 @wip
  Scenario: Verify the single/sequence of prompts is displayed for the single step process
    Given  I am in the prompts section
    And Verify the single/sequence of prompts is displayed for a section

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
  Scenario: Verify if I am able to the see the combination of textbox/checkbox/radio button as answer type with the label associated to the question
    Then I navigate to a step, section, prompt
    And I see a response tagged to the prompt
    And verify I see a combinations of textbox/checkbox/radio  with a label associated

  @CHAMP-13 @wip
  Scenario: Verify if I am able to the alignment of textbox/checkbox/radio button as answer type with the label associated to the question
    Then I navigate to a step, section, prompt
    And I see a response tagged to the prompt
    And verify I see a combinations of textbox/checkbox/radio  with a label associated and aligned correctly

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
