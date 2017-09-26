Feature: Format RODS data in Prompt text

  Background:
    Given I have basic loan data "807000"
    And I have the business process created as "process1"
    And I have the steps "step1" created for business process with order "1"
    And I have sections configured for steps as "section1" with order "1"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for currency
    Given I have loan data for "807000" and "20000"
    And I have prompt configured with rods value for currency
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "$20,000"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with null value for currency
    Given I have loan data for "807000" with null values
    And I have prompt configured with rods value for currency
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I don't see the prompt text
  
  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with empty value for currency
    Given I have loan data for "807000" and ""
    And I have prompt configured with rods value for currency
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I don't see the prompt text

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for currency with decimal points roundup with trailing zero
    Given I have loan data for "807000" and "20000.09673"
    And I have prompt configured with rods value for currency
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "$20,000.10"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for currency with decimal points roundup without trailing zero
    Given I have loan data for "807000" and "20000.19673"
    And I have prompt configured with rods value for currency
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "$20,000.20"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for currency with trailing zeroes
    Given I have loan data for "807000" and "00020000.196"
    And I have prompt configured with rods value for currency
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "$20,000.20"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for currency with large value
    Given I have loan data for "807000" and "20000000000"
    And I have prompt configured with rods value for currency
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "$20,000,000,000.00"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for currency with negative value
    Given I have loan data for "807000" and "-20000000"
    And I have prompt configured with rods value for currency
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "($20,000,000.00)"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for date
    Given I have loan data for "807000" and "2016-09-20"
    And I have prompt configured with rods value for date
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "09/20/2016"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with null value for date
    Given I have loan data for "807000" with null values
    And I have prompt configured with rods value for date
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I don't see the prompt text

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with empty value for date
    Given I have loan data for "807000" and ""
    And I have prompt configured with rods value for date
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I don't see the prompt text

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for date with invalid date
    Given I have loan data for "807000" and "2016-9-20"
    And I have prompt configured with rods value for date
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "Invalid date"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for phoneno
    Given I have loan data for "807000" and "0123456789"
    And I have prompt configured with rods value for phoneno
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "(012)-345-6789"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with null value for phoneno
    Given I have loan data for "807000" with null values
    And I have prompt configured with rods value for phoneno
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I don't see the prompt text

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with empty value for phoneno
    Given I have loan data for "807000" and ""
    And I have prompt configured with rods value for phoneno
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I don't see the prompt text

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for phoneno with invalid value
    Given I have loan data for "807000" and "01234567"
    And I have prompt configured with rods value for phoneno
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "01234567"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for extn
    Given I have loan data for "807000" and "0123456"
    And I have prompt configured with rods value for extn
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "012-3456"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with null value for extn
    Given I have loan data for "807000" with null values
    And I have prompt configured with rods value for extn
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I don't see the prompt text

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with empty value for extension
    Given I have loan data for "807000" and ""
    And I have prompt configured with rods value for extn
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I don't see the prompt text

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for extn with invalid values
    Given I have loan data for "807000" and "01234568"
    And I have prompt configured with rods value for extn
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "012-34568"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for ssn
    Given I have loan data for "807000" and "012345689"
    And I have prompt configured with rods value for ssn
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "XXX-XX-5689"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with null value for ssn
    Given I have loan data for "807000" with null values
    And I have prompt configured with rods value for ssn
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I don't see the prompt text

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with empty value for ssn
    Given I have loan data for "807000" and ""
    And I have prompt configured with rods value for ssn
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I don't see the prompt text

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for ssn with invalid values
    Given I have loan data for "807000" and "123"
    And I have prompt configured with rods value for ssn
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "XXX-XX-X123"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for percentage
    Given I have loan data for "807000" and "88.5"
    And I have prompt configured with rods value for percentage
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "88.50 %"

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with null value for percentage
    Given I have loan data for "807000" with null values
    And I have prompt configured with rods value for percentage
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I don't see the prompt text

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with empty value for percentage
    Given I have loan data for "807000" and ""
    And I have prompt configured with rods value for percentage
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I don't see the prompt text

  @CHAMP-1306 @regression @smoke
  Scenario: Verify the prompt text with rods value for percentage with trailing zeroes[round up]
    Given I have loan data for "807000" and "0088.498"
    And I have prompt configured with rods value for percentage
    Then I am in the Loan Search Page
    And I search for "807000"
    And I select loan number "807000" from search result
    And I see the prompt text with rods value as "88.50 %"