FactoryGirl.define do
  # indicator = %w(Y N)
  lossAmount = Faker::Number.decimal(2,4)
  potentialAmount = (lossAmount.to_f * 0.15).to_s
  factory :loan do
    sequence(:latestTransaction) {FactoryGirl.attributes_for(:transaction)}
    sequence(:loanNumber, 803_000, &:to_s)
    previousLoanStatus Faker::Lorem.word
    borrowerFirstName Faker::Name.first_name
    borrowerLastName  Faker::Name.last_name
    borrowerMiddleName Faker::Name.first_name
    borrowerDOB Faker::Date.between(90.years.ago, 60.years.ago).strftime('%F')
    borrowerMobilePhoneNumber Faker::Number.number(10)
    propertyAddress Faker::Address.street_address true
    propertyCity Faker::Address.city
    propertyState Faker::Address.state_abbr
    propertyZipCode Faker::Address.zip
    borrowerHomePhoneNumber Faker::Number.number(10)
    borrowerWorkPhoneNumber Faker::Number.number(10)
    borrowerSSN Faker::Number.number(9)
    mailAddress Faker::Address.street_address true
    mailCity Faker::Address.city
    mailState Faker::Address.state_abbr
    mailZipCode Faker::Address.zip_code
    coBorrowerFirstName Faker::Name.first_name
    coBorrowerLastName Faker::Name.last_name
    coBorrowerMiddleName Faker::Name.first_name
    coBorrowerDOB Faker::Date.between(90.years.ago, Date.today).strftime('%F')
    coBorrowerSSN Faker::Number.number(9)
    coBorrowerHomePhoneNumber Faker::Number.number(10)
    coBorrowerWorkPhoneNumber Faker::Number.number(10)
    coBorrowerMobilePhoneNumber Faker::Number.number(10)
    spocName Faker::Name.name
    taxAndInsuranceAmountOwed Faker::Number.negative(2,4)
    investorLoanNumber Faker::Number.number(10)
    productCode Faker::Lorem.word
    reversePaymentPlanTypeCode Faker::Lorem.sentence(3, true, 0)
    interestTypeCode 'example'+ %w[123 234 345].shuffle.first
    borrowerEmailId Faker::Internet.free_email
    borrowerAgeAtApplicationYearCount Faker::Number.number(4)
    coBorrowerEmailId 'trial@gmail.com '
    coBorrowerAgeAtApplicationYearCount Faker::Number.number(2)
    borrowerAddressMailCountryCode Faker::Address.country_code
    loanActiveIndicator 'Y'
    spocPhoneNumber Faker::Number.number(10)
    spocPhoneExtensionNumber Faker::Number.number(10)
    propertyCountyName Faker::Address.country
    propertyFIPSCountyCode Faker::Address.country_code
    strategyCode Faker::Lorem.word
    propertyOccupiedTypeCode Faker::Lorem.word
    equityGreaterThanTenPercent Faker::Number.number(5)
    offerAmount Faker::Number.number(4)
    foreclosureDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    lastTaxAndInsurancePaymentAmount Faker::Number.number(4)
    lastTaxAndInsurancePaymentDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    mostRecentAppraisalValue Faker::Number.decimal(2)
    mostRecentAppraisalDate Faker::Date.between(1.years.ago, Date.today).strftime('%F')
    reoEconomicAmount Faker::Number.number(4)
    sSDILEconomicAmount Faker::Number.number(4)
    economicSaveAmount ''
    notionalDICurtailedAmount nil
    pVDICurtailedAmount Faker::Number.number(4)
    solicitationLetterId Faker::Number.number(4)
    sequence(:solicitationLetterDate) {Faker::Date.between(2.years.ago, Date.today)}
    mostRecentOcupancyCheckTypeCode Faker::Number.number(4)
    mostRecentOcupancyCheckDate  {Faker::Date.between(1.years.ago, Date.today)}
    borrowerDeathDate { Faker::Date.between(2.years.ago, Date.today) }
    coBorrowerDeathDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    repaymentPlanSetupDate Faker::Date.forward(3650).strftime('%F')
    repaymentPlanBrokenDate Faker::Date.forward(3650).strftime('%F')
    firstExtensionDeadlineDate Faker::Date.forward(365).strftime('%F')
    secondExtensionDeadlineDate Faker::Date.forward(1000).strftime('%F')
    thirdExtensionDeadlineDate Faker::Date.forward(2000).strftime('%F')
    firstLegalDueDate Faker::Date.forward(1000).strftime('%F')
    referralDate Faker::Date.forward(1000).strftime('%F')
    referToForeclosureDate Faker::Date.forward(1000).strftime('%F')
    firmName Faker::Name.name
    foreclosureScheduleSaleDate Faker::Date.forward(3650).strftime('%F')
    foreclosureActualSaleDate Faker::Date.forward(3650).strftime('%F')
    investorName Faker::Name.name
    highRisk 'Y'
    totalLossAmount (lossAmount)
    potentialIncentiveAmount (potentialAmount)
    callDueDate Faker::Date.forward(3650).strftime('%F')
    mcaPercentage Faker::Number.decimal(4)
    maxProcessDate Faker::Date.forward(3650).strftime('%F')
    campaignName Faker::Lorem.word
    alternateContacts {[FactoryGirl.attributes_for(:contacts)]}
    nonBorrowerSpouse {FactoryGirl.attributes_for(:spouse)}
    defaultDate Faker::Date.forward(3650).strftime('%F')
    paymentTransactionCount Faker::Number.number(1)
    tipaymentPlanStartDate Faker::Date.backward(3650).strftime('%F')
    tipaymentPlanEndDate Faker::Date.forward(3650).strftime('%F')
    occfirstLetterSentDate Faker::Date.backward(3650).strftime('%F')
    occresolvedDate Faker::Date.backward(3650).strftime('%F')
    tirpadueDate Faker::Date.forward(3650).strftime('%F')
    occcertificationDate Faker::Date.backward(3650).strftime('%F')
    mcadate Faker::Date.forward(3650).strftime('%F')
  end
end