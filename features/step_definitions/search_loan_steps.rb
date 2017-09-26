# frozen_string_literal: true
Given(/^I am in the Loan Search Page$/) do
  visit_search_page
end

Given(/^I have the following loans in RODS which can be searched through "([^"]*)"$/) do |query, table|
  criteria = {query: query}
  loans = table.hashes.map { |loan| FactoryGirl.attributes_for(:basic_loan, loan) }
  RodsService.instance.stub_basic_loan(criteria, loans)
end

Then(/^I should be on the search page$/) do
  @search_page.visible?
end

And(/^I am done setting up data$/) do
  RodsService.instance.save
end

Then(/^I should see the following result:$/) do |table|
  check_results(table.hashes)
end

Then(/^I should see the error "([^"]*)" indicated by "([^"]*)"$/) do |error, icon|
  validate_error_message(error,icon)
end

And(/^I should see the user input error$/) do | |
  enter_data_error_validation
end

And(/^I select loan number "([^"]*)" from search result$/) do |loan_number|
  select_result_with_loan_number(loan_number)
end

Then(/^I should be able to see search box:$/) do
  @search_page.has_query_field
end

When(/^I search for "([^"]*)"$/) do |query|
  search_with(query)
  click_search_button
end

When(/^I search for loan without data$/) do
  click_search_button
end


And(/^I should be on the base page$/) do
  verify_base_page
end