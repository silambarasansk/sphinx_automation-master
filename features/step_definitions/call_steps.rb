Then(/^I see the steps:$/) do |table|
  verify_steps(table)
end

Then(/^I see the configured steps$/) do
  verify_steps_availability(RepositoryQuester.instance.step_data)
end


Given(/^I have the following prompts for "([^"]*)" step "([^"]*)" section:$/) do |arg1, arg2, table|
  # table is a table.hashes.keys # => [:uid, :title, :display_title, :order]
  pending
end