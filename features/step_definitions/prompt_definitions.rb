# And(/^I see the prompt "([^"]*)"$/) do |prompt_text|
#   verify_prompt_title(prompt_text)
# end

And(/^the sequence of prompts is:$/) do |table|
  verify_sequence_prompt(table)
end

And(/^I see the prompt title$/) do
  verify_prompt_title(RepositoryQuester.instance.prompt_data)
end

And(/^I see the prompt text$/) do
  verify_prompt_text(RepositoryQuester.instance.prompt_data)
end

And(/^I see the prompt text as link with email content$/) do
  verify_prompt_text_link(RepositoryQuester.instance.prompt_data)
end

And(/^I see the prompt text as link with email content including rods value$/) do
  verify_prompt_text_rods_email(Repository.instance.loans)
end

And(/^I see the prompt text as link with email content with no spaces$/) do
  verify_prompt_text_rods_email_space
end

And(/^I see the prompt text as link with email content with no mail id$/) do
  verify_empty_email_id
end

And(/^I see the prompt text with rods value$/) do
  verify_prompt_text_rods(Repository.instance.loans)
end

And(/^I see the related information content$/) do
  verify_related_info(RepositoryQuester.instance.prompt_data)
end

Then(/^I see the related information with title as "([^"]*)"$/) do |title|
  verify_related_info_title(title)
end


And(/^I see the prompt text as link with email content with float values$/) do
  verify_prompt_email_float(Repository.instance.loans)
end

And(/^I see the prompt text with rods value as "([^"]*)"$/) do |value|
  verify_prompt_text_rods_format(value)
end

And(/^I don't see the prompt text$/) do
  verify_no_prompt_text
end