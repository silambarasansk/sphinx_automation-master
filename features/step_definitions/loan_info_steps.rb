
Given(/^I am on the loan details page$/) do
  loanpagevisible?
end

Given(/^I have loan "([^"]*)" with high risk indicator as "([^"]*)"/) do |query, indicator|
  Repository.create_basic_loan query
  Repository.create_loan_spl_cases(query,indicator)
end

Then(/^I should see information about the loan$/) do
  check_status_info(Repository.instance.loans)
end

And(/^I should see Borrower Information$/) do
  check_borrower_info(Repository.instance.loans)
end

And(/^I should see property information$/) do
  check_property_info(Repository.instance.loans)
end

And(/^I should see mailing information$/) do
  check_mailing_info(Repository.instance.loans)
end

And(/^I should see alternate contacts information$/) do
  check_alternate_contact(Repository.instance.loans)
end

And(/^I should see Non borrower spouse information$/) do
  check_nonborrowingspouse_info(Repository.instance.loans)
end

When(/^I close the slider$/) do
  toggle_slider
end

Then(/^I should not see the loan details page$/) do
  verify_loan_details_absent
end

When(/^I open the slider$/) do
  toggle_slider
end

When(/^I close "([^"]*)" tab$/) do |tab_name|
  click_tab(tab_name)
end

Then(/^open  all the tabs in left pane$/) do |tab_name|
  click_tab(tab_name)
end

And(/^I open "([^"]*)" tab$/) do |tab_name|
  click_tab(tab_name)
end

And(/^Verify Potential incentive amount is fifteen percent of (.*)$/) do |totalLossAmount|
  evaluate_potential_amount(totalLossAmount)
end

Then(/^I should see (.*) in the tab$/) do |name|
    check_if_detail_visible(name)
end

Then(/^I should see property information as "([^"]*)" in the tab$/) do |address|
  check_if_detail_visible(address)
end

Then(/^I should see mailing information as "([^"]*)" in the tab$/) do |mailinfo|
  check_if_detail_visible(mailinfo)
end

Then(/^I should see alternate contact as "([^"]*)" in the tab$/) do |alternatecontact|
  check_if_detail_visible(alternatecontact)
end

Then(/^I should see Non borr spouse as "([^"]*)" in the tab$/) do |nonborrinfo|
  check_if_detail_visible(nonborrinfo)
end

And(/^I should see Total loss, Potential incentive amount is hidden if High risk indicator is N$/) do
  check_loss_amount_if_n
end


And(/^I should see the red highlight for foreclosure status$/) do
  highlight_values_red
end


And(/^I click on mr.cooper icon to return back to home page$/) do
  return_home
end