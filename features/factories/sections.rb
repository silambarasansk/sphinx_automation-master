# frozen_string_literal: true
FactoryGirl.define do
  factory :section do
    sequence(:uid) {|n| "section#{n}" }
    sequence(:name) {|n| "section#{n}" }
    sequence(:order) {|n| n }
    rule { {'*': {'from': [3, 3]}} }
    # sequence(:prompts) {FactoryGirl.attributes_for(:prompt)}
  end
end
