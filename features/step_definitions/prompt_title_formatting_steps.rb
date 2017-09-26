PROMPT_RODS_VALUE_CURRENCY = "{{format 'currency' loan.sSDILEconomicAmount}}"
PROMPT_RODS_VALUE_DATE = "{{format 'date' loan.sSDILEconomicAmount}}"
PROMPT_RODS_VALUE_PHONENO = "{{format 'phone' loan.sSDILEconomicAmount}}"
PROMPT_RODS_VALUE_EXTN = "{{format 'extn' loan.sSDILEconomicAmount}}"
PROMPT_RODS_VALUE_SSN = "{{format 'ssn' loan.sSDILEconomicAmount}}"
PROMPT_RODS_VALUE_PERCENTAGE = "{{format 'percentage' loan.sSDILEconomicAmount}}"

Given(/^I have prompt configured with rods value for currency$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_RODS_VALUE_CURRENCY)
end


Given(/^I have prompt configured with rods value for date$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_RODS_VALUE_DATE)
end

Given(/^I have prompt configured with rods value for phoneno$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_RODS_VALUE_PHONENO)
end

And(/^I have prompt configured with rods value for extn$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_RODS_VALUE_EXTN)
end

And(/^I have prompt configured with rods value for ssn$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_RODS_VALUE_SSN)
  end

And(/^I have prompt configured with rods value for percentage$/) do
  RepositoryQuester.create_prompt_spl_case(text: PROMPT_RODS_VALUE_PERCENTAGE)
end