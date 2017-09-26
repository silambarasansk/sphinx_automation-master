FactoryGirl.define do
  loan_status_code = '0'
  factory :transaction do
    sourceApplicationCode Faker::Lorem.word
    transactionTypeCode Faker::Number.number(3)
    transactionDate Faker::Date.backward(10)
    loanStatusCode loan_status_code
    loanStatusDescription Faker::Lorem.word
    borrowerCorrespondenceLoanStatusDescription Faker::Lorem.sentence(3)
    dropBoxLoanStatusDescription Faker::Lorem.sentence(3)
    transactionEffectiveDate Faker::Date.backward(5)
    reverseNetLineOfCRAmount Faker::Number.decimal_part(4)
    upbAmount Faker::Number.decimal_part(4)
    mipRT Faker::Number.decimal_part(4)
    currentInterestRatePercent Faker::Number.decimal_part(4)
    currentLineOfCRRSVAmount Faker::Number.decimal_part(4)
    currentServiceFeeSetAsideAmount Faker::Number.decimal_part(4)
    originalRepairSetAsideAmount Faker::Number.decimal_part(4)
    currentRepairSetAsideAmount Faker::Number.decimal_part(4)
    termNumberOfMonthLeftCount Faker::Number.decimal_part(4)
    transactionSequenceNumber Faker::Number.decimal_part(4)
  end
end
