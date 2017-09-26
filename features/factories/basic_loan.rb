# frozen_string_literal: true
FactoryGirl.define do
  city = %w[Dallas Johnstown]
  state = %w[OH TX]
  zip = [5,9]
  factory :basic_loan do
    # sequence(:loanNumber, 803_000, &:to_s)
    sequence(:loanNumber, 807_000, &:to_s)
    borrowerFullName {"#{Faker::Name.first_name} #{Faker::Name.last_name}"}
    borrowerDOB {Faker::Date.between(90.years.ago, Date.today).strftime('%F')}
    propertyAddress {Faker::Address.street_address true}
    propertyCity (city).sample
    propertyState (state).sample
    zip {Faker::Number.number(zip.sample)}
    phone {Faker::Number.number(10)}
    loanStatusDescription {Faker::Address.city}
    coBorrowerFullName {"#{Faker::Name.first_name} #{Faker::Name.last_name}"}
    sequence(:borrowerSsn, '0990', &:to_s)
    coBorrowerSsn {Faker::Number.number(4)}
  end
end
