Given(/^I enter notes "([^"]*)" in the notes section$/) do |notes|
  # toggle_notes
  add_note(notes)
end

When(/^I close the notes section$/) do
  close_notes
end

And(/^I open the notes$/) do
  toggle_notes
end

And(/^I reopen the notes$/) do
  toggle_notes
end

And(/^I see the call recap screen$/) do
  verify_recap_screen
end

Then(/^I should see the saved note "([^"]*)"$/) do |notes|
  validate_notes(notes)
end

And(/^I click the call recap screen$/) do
  toggle_recap
end

Then(/^I should see the saved note "([^"]*)" in the recap screen$/) do |notes|
  validate_recap_notes(notes)
end

And(/^I edit the notes to "([^"]*)"$/) do |notes|
  edit_recap_notes(notes)
end

And(/^I see the notes title as "([^"]*)"$/) do |notes|
  validate_notes_title(notes)
end

Then(/^I see "([^"]*)" help in Notes body$/) do |notes|
  validate_notes_body(notes)
end

Then(/^I should see the system generated notes placeholder$/) do
  validate_sys_note_placeholder
end

And(/^I see the system notes title as "([^"]*)"$/) do |notes|
  validate_sys_note_title(notes)
end

Then(/^I should see the saved system note$/) do
  validate_sys_note(RepositoryQuester.instance.step_data)
end

Then(/^I should see the saved system note in the recap screen$/) do
  validate_recap_sys_notes(RepositoryQuester.instance.step_data)
end

And(/^I see no notes$/) do
  validate_no_notes
end