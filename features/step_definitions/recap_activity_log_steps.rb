Given(/^I've filled the responses "([^"]*)" and "([^"]*)"$/) do |radio_value, text_value|
  select_radio_button(radio_value)
  fill_text_box(text_value)
  click_next
end

When(/^I complete the call$/) do
  toggle_recap
  end_call
end

And(/^I re\-search for the loan "([^"]*)"$/) do |query|
  search_with(query)
  click_search_button
  select_result_with_loan_number(query)
end

Then(/^I should see the activity log entry:$/) do |table|
  toggle_activity_log
  validate_activity_log_overlay
  validate_activity_log_entry
  validate_log_entry(table.raw)
end

And(/^I should see the following step names in the order$/) do |table|
  validate_step_names(table.raw.flatten)
end

And(/^I see the recap title as "([^"]*)"$/) do |user_note|
  validate_recap_title(user_note)
end

Then(/^I see "([^"]*)" help in Call recap screen$/) do |usernote|
  validate_recap_body(usernote)
end

And(/^I should see "([^"]*)" title$/) do |title|
  validate_call_completion(title)
end

Then(/^I should see "([^"]*)" help message$/) do |task|
  validate_call_completion_task(task)
end

And(/^I should see the "([^"]*)" button$/) do |button|
  validate_button(button)
end

And(/^I should see the "([^"]*)" button disabled$/) do |button|
  validate_button_disabled(button)
end

Then(/^I click on "([^"]*)" button$/) do |button|
  click_button(button)
end

Then(/^I see the button text changed to "([^"]*)"$/) do |button|
  validate_button_change(button)
end

Then(/^I should have the notes copied$/) do
validate_copy
end

Then(/^I should see the user notes "([^"]*)" and system notes are displayed together$/) do |user_note|
  validate_system_user_note user_note, RepositoryQuester.instance.step_data
end

And(/^It should be pasted$/) do
  pending
end

