require_relative 'utils/formatters'

class Loan
  include Formatters
  attr_accessor :latestTransaction, :loanNumber, :previousLoanStatus, :borrowerFirstName, :borrowerLastName,
                :borrowerMiddleName, :borrowerDOB, :borrowerMobilePhoneNumber, :propertyAddress,
                :propertyCity, :propertyState, :propertyZipCode, :borrowerHomePhoneNumber,
                :borrowerWorkPhoneNumber, :borrowerSSN, :mailAddress, :mailCity,
                :mailState, :mailZipCode, :coBorrowerFirstName, :coBorrowerLastName,
                :coBorrowerMiddleName, :coBorrowerDOB, :coBorrowerSSN, :coBorrowerHomePhoneNumber,
                :coBorrowerWorkPhoneNumber, :coBorrowerMobilePhoneNumber, :spocName, :taxAndInsuranceAmountOwed,
                :investorLoanNumber, :productCode, :reversePaymentPlanTypeCode, :interestTypeCode,
                :borrowerEmailId, :borrowerAgeAtApplicationYearCount, :coBorrowerEmailId, :coBorrowerAgeAtApplicationYearCount,
                :borrowerAddressMailCountryCode, :loanActiveIndicator, :spocPhoneNumber, :spocPhoneExtensionNumber,
                :propertyCountyName, :propertyFIPSCountyCode, :strategyCode, :propertyOccupiedTypeCode,
                :equityGreaterThanTenPercent, :offerAmount, :foreclosureDate, :lastTaxAndInsurancePaymentAmount,
                :lastTaxAndInsurancePaymentDate, :mostRecentAppraisalValue, :mostRecentAppraisalDate, :reoEconomicAmount,
                :sSDILEconomicAmount, :economicSaveAmount, :notionalDICurtailedAmount, :pVDICurtailedAmount,
                :solicitationLetterId, :solicitationLetterDate, :mostRecentOcupancyCheckTypeCode, :mostRecentOcupancyCheckDate,
                :borrowerDeathDate, :coBorrowerDeathDate, :repaymentPlanSetupDate, :repaymentPlanBrokenDate,
                :firstExtensionDeadlineDate, :secondExtensionDeadlineDate, :thirdExtensionDeadlineDate,
                :firstLegalDueDate, :referralDate, :referToForeclosureDate, :firmName,
                :foreclosureScheduleSaleDate, :foreclosureActualSaleDate, :investorName, :highRisk,
                :totalLossAmount, :potentialIncentiveAmount, :callDueDate, :mcaPercentage,
                :maxProcessDate, :campaignName, :alternateContacts, :nonBorrowerSpouse, :defaultDate,
                :paymentTransactionCount, :tipaymentPlanStartDate, :tipaymentPlanEndDate, :occfirstLetterSentDate,
                :occresolvedDate, :tirpadueDate, :occcertificationDate, :mcadate

  def loan_info
    {
        'FCL SCHEDULED SALE DATE' => format_date(foreclosureScheduleSaleDate),
        'LOAN NUMBER' => loanNumber,
        'LOAN STATUS' => latestTransaction[:loanStatusDescription].upcase,
        'PREVIOUS STATUS' => previousLoanStatus.upcase,
        'LINE OF CREDIT' => format_currency(latestTransaction[:reverseNetLineOfCRAmount]),
        'PAYMENT PLAN TYPE' => reversePaymentPlanTypeCode.upcase,
        'CAMPAIGN NAME' => campaignName.upcase,
        'SPOC' => spocName.upcase,
        'INVESTOR NAME' => investorName.upcase,
        'HIGH RISK' => highRisk,
        'TOTAL LOSS' => format_currency(totalLossAmount),
        'POTENTIAL INCENTIVE AMOUNT' => format_currency(potentialIncentiveAmount),
        'CALLED DUE DATE' => format_date(callDueDate),
        'DEFAULT BALANCE' => format_negative_currency(taxAndInsuranceAmountOwed),
        'MCA%' => format_percentage(mcaPercentage),
        'REFERRAL DATE' => format_date(referralDate),
        'FIRM NAME' => firmName.upcase
    }
  end

  def borrower_info
    {
        'BORROWER NAME' => ("#{borrowerFirstName}" + ' ' + "#{borrowerMiddleName}" + ' '+ "#{borrowerLastName}").upcase,
        'BORROWER DOB' => format_date(borrowerDOB),
        'HOME PHONE NUMBER' => format_phone_number(borrowerHomePhoneNumber),
        'WORK PHONE NUMBER' => format_phone_number(borrowerWorkPhoneNumber),
        'BORROWER SSN' => format_ssn(borrowerSSN),
        'CO-BORROWER NAME' => (coBorrowerFirstName + ' ' + coBorrowerMiddleName + ' ' + coBorrowerLastName).upcase,
        'CO-BORROWER DOB' => format_date(coBorrowerDOB),
        'CO-BORROWER SSN' => format_ssn(coBorrowerSSN)
    }
  end

  def property_info
    {
        'ADDRESS' => propertyAddress.upcase,
        'CITY' => propertyCity.upcase,
        'STATE' => propertyState.upcase,
        'ZIP' => propertyZipCode
    }
  end

  def mailing_info
    {
        'ADDRESS' => mailAddress.upcase,
        'CITY' => mailCity.upcase,
        'STATE' => mailState.upcase,
        'ZIP' => mailZipCode
    }
  end

  def alternate_contacts
    {
        'NAME' => alternateContacts.map { |ac| "#{ac[:firstName]} #{ac[:middleName]} #{ac[:lastName]}".upcase }.join(','),
        'RELATIONSHIP' => alternateContacts.map { |ac| "#{ac[:relationship]}".upcase}.join(','),
        'PHONE NUMBER' => format_phone_inside_array(alternateContacts.map { |ac| "#{ac[:mobilePhoneNumber]}"})
    }
  end

  def nonBorrower_Spouse
    {
        'NBS FIRST NAME'  => nonBorrowerSpouse[:firstName].upcase,
        'NBS LAST NAME' => nonBorrowerSpouse[:lastName].upcase,
        'NBS SSN' => format_ssn(nonBorrowerSpouse[:ssn]),
        'NBS DOB' => format_date(nonBorrowerSpouse[:birthDate]),
        'NBS WRITTEN REQUEST RECEIVED DATE' => format_date(nonBorrowerSpouse[:writtenRequestReceivedDate]),
        'NBS DRIVER\'S LICENCE/STATE ID RECEIVED DATE' => format_date(nonBorrowerSpouse[:driverLicenseDate]),
        'NBS CURRENT UTILITY BILLS RECEIVED DATE' => format_date(nonBorrowerSpouse[:currentUtilityBillReceivedDate]),
        'NBS CURRENT BANK STATEMENTS RECEIVED DATE' => format_date(nonBorrowerSpouse[:currentBankStatementRecievedDate]),
        'NBS OTHER RECEIVED DATE' => format_date(nonBorrowerSpouse[:otherReceivedDate]),
        'NBS MARRIAGE CERTIFICATE RECEIVED DATE' => format_date(nonBorrowerSpouse[:marriageCertificateReceivedDate]),
        'NBS DEATH CERTIFICATE RECEIVED DATE' => format_date(nonBorrowerSpouse[:deathCertificateReceivedDate]),
        'NBS PROOF OF MARKETABLE TITLE RECEIVED DATE' => format_date(nonBorrowerSpouse[:proofOfMarkatableTitleReceivedDate]),
        'MOE ELECTION MADE TO HUD DATE' => format_date(nonBorrowerSpouse[:electionMadeToHudDate]),
        'MOE ASSESSMENT APPROVAL DATE' => format_date(nonBorrowerSpouse[:assesementApprovalDate]),
        'MOE ASSESSMENT DENIAL DATE' => format_date(nonBorrowerSpouse[:assesementDenialDate]),
        'MOE APPROVAL LETTER SENT DATE' => format_date(nonBorrowerSpouse[:approvalLetterSentDate]),
        'MOE DENIAL LETTER SENT DATE' => format_date(nonBorrowerSpouse[:denialLetterSentDate])
    }
  end
end

