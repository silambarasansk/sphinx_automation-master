# frozen_string_literal: true

PROMPT_EMAIL_TEXT = '<a href="mailto:trial@gmail.com?subject=subject is here&body=this is a trial">trial</a>'
PROMPT_EMAIL_SPECIAL = '<a href="mailto:4.00#@AS?subject=subject is here&body=this is a trial">trial</a>'
PROMPT_EMAIL_SPACES_RODS = '<a href="mailto:{{trim loan.coBorrowerEmailId}}?subject=subject is here&body=this is a trial">trial</a>'
PROMPT_EMAIL_FLOAT_RODS = '<a href="mailto:{{trim loan.mostRecentAppraisalValue}}?subject=subject is here&body=this is a trial">trial</a>'
PROMPT_EMAIL_VALID_EMAIL_RODS =  '<a href= "mailto:{{loan.borrowerEmailId}}?subject=subject is having {{loan.borrowerFirstName}}&body=this is a phone {{loan.coBorrowerHomePhoneNumber}} {{loan.borrowerDOB}}">trial</a>'
PROMPT_EMAIL_NULL_RODS = '<a href="mailto:{{loan.notionalDICurtailedAmount}}?subject=subject is here&body=this is a trial">trial</a>'
PROMPT_EMAIL_EMPTY_RODS = '<a href="mailto:{{trim loan.economicSaveAmount}}?subject=subject is here&body=this is a trial">trial</a>'
PROMPT_RODS_VALUE = '{{loan.borrowerFirstName}} {{loan.borrowerDOB}} {{loan.borrowerEmailId}} {{loan.economicSaveAmount}} {{loan.coBorrowerHomePhoneNumber}}'
RADIO_RESPONSE = {"values"=>["Test1",  "Test2"]}
TEXT_RESPONSE = {label: "Name", validations: ""}
PHONE_RESPONSE = {label: "Name", validations: "\\d{10}"}
EXTN_RESPONSE = {label: "Name", validations: ""}


And(/^I have the business process created$/) do
  RepositoryQuester.create_buss_process
end

And(/^I have the business process created as "([^"]*)"$/) do |arg|
  RepositoryQuester.create_buss_processes arg
end

And(/^I have the steps created for business process$/) do
  RepositoryQuester.create_step
end

And(/^I have the steps "([^"]*)" created for business process with order "([^"]*)"$/) do |arg1, arg2|
  RepositoryQuester.create_steps arg1, arg2
end

And(/^I have sections configured for steps$/) do
  RepositoryQuester.create_section
end

And(/^I have sections configured for steps as "([^"]*)" with order "([^"]*)"$/) do |arg1, arg2|
  RepositoryQuester.create_sections arg1, arg2
end

And(/^I have prompt configured for section$/) do
  RepositoryQuester.create_prompt
end

Given(/^I have prompt configured as "([^"]*)" for section with order "([^"]*)"$/) do |arg1, arg2|
  RepositoryQuester.create_prompts arg1, arg2
end

Given(/^I have prompt configured with email content in prompt text$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_EMAIL_TEXT)
end

Given(/^I have prompt configured with email content with float\/alphanumeric value in prompt text$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_EMAIL_SPECIAL)
end

Given(/^I have prompt configured with rods data email id with spaces in prompt text$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_EMAIL_SPACES_RODS)
end

Given(/^I have prompt configured with rods data email id with float values in prompt text$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_EMAIL_FLOAT_RODS)
end

Given(/^I have prompt configured with rods data email id in prompt text$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_EMAIL_VALID_EMAIL_RODS)
end

Given(/^I have prompt configured with rods value in prompt text$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_RODS_VALUE)
end

Given(/^I have prompt configured with Empty rods data email id in prompt text$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_EMAIL_EMPTY_RODS)
end

Given(/^I have prompt configured with null rods data email id in prompt text$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_EMAIL_NULL_RODS)
end

And(/^I have "([^"]*)" response "([^"]*)" configured for a prompt with order "([^"]*)"$/) do |input_type, uid, order|
  RepositoryQuester.create_responses(input_type, uid, order, RADIO_RESPONSE)
end

And(/^I have text response "([^"]*)" configured for a prompt with order "([^"]*)"$/) do |uid, order|
  RepositoryQuester.create_responses("text", uid, order, TEXT_RESPONSE)
end

And(/^I have phone response "([^"]*)" configured for a prompt with order "([^"]*)"$/) do |uid, order|
  RepositoryQuester.create_responses("phone", uid, order, PHONE_RESPONSE)
end

And(/^I have extension response "([^"]*)" configured for a prompt with order "([^"]*)"$/) do |uid, order|
  RepositoryQuester.create_responses("extn", uid, order, EXTN_RESPONSE)
end