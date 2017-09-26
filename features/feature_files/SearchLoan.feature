Feature: Search for a Loan.


  Background:
    And I am in the Loan Search Page

  @CHAMP-4 @search  @regression @smoke 
  Scenario: Validating Pagination on Loan search page
    Given I have multiple loans for "propertyCity" and "propertyState":
      | Dallas    | tx |
      | Johnstown | OH |
    And I search for "Dallas"
    Then I should see the loans in paginated form showing page "1"
    Given I click on "next" button in pagination
    Then I should see the loans in paginated form showing page "2"

  @CHAMP-4 @search @smoke
  Scenario: Validating Sorting on Loan search page
    Given I have multiple loans for "Dallas"
    And I search for "Dallas"
    Then I should see the page with no sorting
    And I sort the "BORROWER" ascending
    Then I should see the "BORROWER" column sorted ascending
    And I sort the "BORROWER" descending
    Then I should see the "BORROWER" column sorted descending

  @CHAMP-4 @search  @regression @smoke
  Scenario: Validating Sorting on all other fields in Loan search page
    Given I have multiple loans for "Dallas"
    And I search for "Dallas"
    Then I should see the page with no sorting
    And I sort the "LOAN NUMBER" ascending
    Then I should see the "LOAN NUMBER" column sorted ascending by number
    And I sort the "LOAN NUMBER" descending
    Then I should see the "LOAN NUMBER" column sorted descending by number
    And I sort the "SSN" ascending
    Then I should see the "SSN" column sorted ascending by number
    And I sort the "SSN" descending
    Then I should see the "SSN" column sorted descending by number
    And I sort the "CO-BORROWER" ascending
    Then I should see the "CO-BORROWER" column sorted ascending
    And I sort the "CO-BORROWER" descending
    Then I should see the "CO-BORROWER" column sorted descending
    And I sort the "CO-SSN" ascending
    Then I should see the "CO-SSN" column sorted ascending by number
    And I sort the "CO-SSN" descending
    Then I should see the "CO-SSN" column sorted descending by number
    And I sort the "DATE OF BIRTH" ascending
    Then I should see the DATE OF BIRTH column sorted ascending by date
    And I sort the "DATE OF BIRTH" descending
    Then I should see the DATE OF BIRTH column sorted descending by date
    And I sort the "ADDRESS" ascending
    Then I should see the "ADDRESS" column sorted ascending
    And I sort the "ADDRESS" descending
    Then I should see the "ADDRESS" column sorted descending
#    And I sort the "CITY" ascending
#    Then I should see the "CITY" column sorted ascending
#    And I sort the "CITY" descending
#    Then I should see the "CITY" column sorted descending
#    And I sort the "STATE" ascending
#    Then I should see the "STATE" column sorted ascending
#    And I sort the "STATE" descending
#    Then I should see the "STATE" column sorted descending
    And I sort the "ZIPCODE" ascending
    Then I should see the "ZIPCODE" column sorted ascending by number
    And I sort the "ZIPCODE" descending
    Then I should see the "ZIPCODE" column sorted descending by number
    And I sort the "PHONE NUMBER" ascending
    Then I should see the "PHONE NUMBER" column sorted ascending
    And I sort the "PHONE NUMBER" descending
    Then I should see the "PHONE NUMBER" column sorted descending


  @CHAMP-4 @search  @smoke @regression
  Scenario: Validating search when RODS service is unavailable
    Given The RODS service is responding with "unavailable"
    When I search for "Micheal"
    Then I should see the error "The data service is not responding, please try again later" indicated by "info-circle"

  @CHAMP-4 @search  @regression @smoke 
  Scenario: Validating search when RODS service timeouts
    Given The RODS service is responding with "timeouts"
    When I search for "807000"
    Then I should see the error "The data service is not responding, please try again later" indicated by "info-circle"

  @CHAMP-4 @search  @regression @smoke 
  Scenario: Validating the Loan Search Results with invalid data
    Given The RODS service is responding with "not_found"
    When I search for "Micheal"
    Then I should see the error "What you are looking for doesn't exist" indicated by "info-circle"

  @CHAMP-4 @search  @regression @smoke 
  Scenario: Verify the error message when user clicks on Search button without entering any values in search fields.
    When I search for loan without data
    Then I should see the user input error

  @CHAMP-4 @search @regression @smoke
  Scenario: Validating the Loan search page
    Given I have loan "807000"
    And I search for "807000"
    Then I should see the search result
