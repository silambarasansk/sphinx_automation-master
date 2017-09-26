FactoryGirl.define do
  factory :prompt do
    sequence(:uid, 1) {|n| "prompt#{n}" }
    sequence(:title, 1) {|n| "Prompt#{n}" }
    sequence(:order, 1) {|n| n }
    # rule { {'*': {'from': [3, 3]}} }
    text {Faker::Lorem.sentence}
    display_title {Faker::Lorem.word}
    related_information {{'content': Faker::Lorem.sentence(80)}}
    # sequence(:responses) {FactoryGirl.attributes_for(:response)}
  end
end
