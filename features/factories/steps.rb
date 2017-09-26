# frozen_string_literal: true
FactoryGirl.define do
  mandatory = %w(true false)
  # notes_separator = %w(, . ;)
  factory :step do
    sequence(:uid, 1) { |n| "step#{n}" }
    # uid {|n| "step#{n}"}
    sequence(:name, 1) { |n| "step#{n}" }
    sequence(:order) { |n| n }
    mandatory (mandatory.sample)
    # notes { FactoryGirl.attributes_for(:notesseparators) }
    notes { {'separator': ' ', 'entries': [{"text": [
        {"type": "text", "value": "Unable to assist, emailed info to Tiffany Dearmon for BK attorney follow-up (if applicable)."}],
         "separator": " ", "rule": {"===": {"from": "loan.latestTransaction.loanStatusCode", "expected": "0", "type": "string"}}}]} }
  end









  # factory :notesseparators do
  #   separator (notes_separator.sample)
  #   entries { [FactoryGirl.attributes_for(:texts)] }
  # end
  #
  # factory :texts do
  #   text [:type]
  #   separator (notes_separator.sample)
  #   rule {{'===': {'from': 'loan.latestTransaction.loanStatusCode', 'expected': '0', 'type': 'string'}}}
  # end
  #
  # factory :type do
  #   type 'text'
  #   value 'Emailed info to Tiffany Dearmon for BK attorney follow-up '
  # end
end
