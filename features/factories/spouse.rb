FactoryGirl.define do
  factory :spouse do
    firstName Faker::Name.first_name
    lastName Faker::Name.last_name
    ssn Faker::Number.number(9)
    birthDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    writtenRequestReceivedDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    driverLicenseDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    currentUtilityBillReceivedDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    currentBankStatementRecievedDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    otherReceivedDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    marriageCertificateReceivedDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    deathCertificateReceivedDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    proofOfMarkatableTitleReceivedDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    electionMadeToHudDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    assesementApprovalDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    assesementDenialDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    approvalLetterSentDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
    denialLetterSentDate Faker::Date.between(5.years.ago, Date.today).strftime('%F')
  end
end
