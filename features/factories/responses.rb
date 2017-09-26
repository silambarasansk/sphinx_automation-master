FactoryGirl.define do
  factory :response do
    sequence(:uid) {|n| "response#{n}" }
    sequence(:order) {|n| n }
    input_type "radiobutton"
    mandatory "true"
    properties {{"values"=>["Test1",  "Test2"]}}
    help_text {Faker::Lorem.sentence}
    # rule { {'*': {'from': [3, 3]}} }
  end
end
