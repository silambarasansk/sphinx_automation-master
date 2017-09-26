class Transaction
  attr_accessor :sourceApplicationCode, :transactionTypeCode, :transactionDate, :loanStatusCode, :borrowerCorrespondenceLoanStatusDescription,
                :dropBoxLoanStatusDescription, :transactionEffectiveDate, :reverseNetLineOfCRAmount, :upbAmount, :mipRT,
                :currentInterestRatePercent, :currentLineOfCRRSVAmount, :currentServiceFeeSetAsideAmount, :originalRepairSetAsideAmount,
                :currentRepairSetAsideAmount, :termNumberOfMonthLeftCount, :transactionSequenceNumber
end