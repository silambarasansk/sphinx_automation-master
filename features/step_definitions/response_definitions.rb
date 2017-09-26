
And(/^I see the responses:$/) do |table|
  verify_response_labels(table)
end

And(/^I see the configured responses$/) do
  verify_response_labels(RepositoryQuester.instance.response_data)
end

Then(/^I answer to the radiobutton response of "([^"]*)"$/) do |prompt_name|
  select_radio_button(prompt_name)
end

Then(/^I answer to the checkbox response$/) do
  select_checkbox
end

Then(/^I answer to the dropdown response$/) do
  select_drop_down
end

Then(/^I answer to the text box response as "([^"]*)"$/) do |text|
  fill_text_box(text)
end

And(/^I should not see the "([^"]*)" button$/) do |button_name|
  validate_no_button(button_name)
end

And(/^I should see there are no responses captured$/) do
  verify_no_response
end

And(/^I should see there are no responses captured for text$/) do
  verify_no_response_text
end

And(/^I should see the responses captured$/) do
  verify_response
end

And(/^I should see the responses captured as "([^"]*)"$/) do |text|
  verify_response_text(text)
end
