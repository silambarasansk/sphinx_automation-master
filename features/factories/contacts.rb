FactoryGirl.define do
  factory :contacts do
    contactPositionNumber 1
    borrowerRPSTTypeCode Faker::Number.number(2)
    firstName Faker::Name.first_name
    lastName Faker::Name.first_name
    middleName Faker::Name.first_name
    fullName ""
    relationship Faker::Lorem.word
    homePhoneNumber Faker::Number.number(10)
    workPhoneNumber Faker::Number.number(10)
    mobilePhoneNumber Faker::Number.number(10)
    legalCapacityTypeCode Faker::Number.number(2)
    relationshipTypeCode Faker::Number.number(2)
  end
end
