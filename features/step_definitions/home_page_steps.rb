
Given(/^I have loan "([^"]*)"$/) do |loan_number|
  Repository.create_basic_loan loan_number
  Repository.populate_loan_fields loan_number
end

Given(/^I have basic loan data "([^"]*)"$/) do |loan_number|
  Repository.create_basic_loan loan_number
end

And(/^I have loan data for "([^"]*)" and "([^"]*)"$/) do |loan_number, title_data|
  Repository.populate_loan_for_title loan_number, title_data
end

Given(/^I have loan data for "([^"]*)" with null values$/) do |loan_number|
  Repository.populate_loan_fields loan_number
end

Given(/^I have multiple loans for "([^"]*)"$/) do |city|
  Repository.create_more_basic(city)
end

And(/^I am on the loan search page$/) do
  visit_search_page
end

Then(/^I should see the search result$/) do
  check_results(Repository.instance.basic_loans)
end

Given(/^The RODS service is responding with "([^"]*)"$/) do |reason|
  status_code = StatusCode.http_status_code_for(reason)
  RodsService.instance.stub_basic_loan({}, [], status_code)
end

Given(/^I have multiple loans for "([^"]*)" and "([^"]*)":$/) do |field1, field2, table|
  Repository.create_bulk_loans(field1, field2, table)
end

Then(/^I should see the loans in paginated form showing page "([^"]*)"$/) do |activePage|
  check_paginated_results(activePage)
end

Given(/^I click on "([^"]*)" button in pagination$/) do |pagination_button|
  click_pagination_button(pagination_button)
end

Then(/^I should see the page with no sorting$/) do
  verify_no_sort
end

And(/^I sort the "([^"]*)" ascending$/) do |sort_value|
  verify_sort_click(sort_value)
end

Then(/^I should see the "([^"]*)" column sorted ascending$/) do |query|
  verify_sort_ascending((Repository.instance.bulk_loans),query)
end

Then(/^I should see the "([^"]*)" column sorted ascending by number$/) do |query|
  verify_sort_ascending_int((Repository.instance.bulk_loans),query)
end

And(/^I sort the "([^"]*)" descending$/) do |sort_value|
  verify_sort_click(sort_value)
end

Then(/^I should see the "([^"]*)" column sorted descending$/) do |query|
  verify_sort_descending((Repository.instance.bulk_loans),query)
end

Then(/^I should see the "([^"]*)" column sorted descending by number$/) do |query|
  verify_sort_descending_int((Repository.instance.bulk_loans),query)
end


Then(/^I should see the DATE OF BIRTH column sorted ascending by date$/) do
  verify_sort_ascending_date(Repository.instance.bulk_loans)
end

Then(/^I should see the DATE OF BIRTH column sorted descending by date$/) do
  verify_sort_descending_date(Repository.instance.bulk_loans)
end
