# frozen_string_literal: true
require_relative 'utils/formatters'

class BasicLoan
  include Formatters
  attr_accessor :loanNumber, :borrowerFullName,
                :borrowerDOB, :propertyAddress, :propertyCity, :propertyState,
                :zip, :phone, :loanStatusDescription, :coBorrowerFullName, :borrowerSsn, :coBorrowerSsn

  def basic_loan_page
    {
        'LOAN NUMBER' => loanNumber,
        'BORROWER' => borrowerFullName,
        'SSN' => borrowerSsn,
        'CO-BORROWER' => coBorrowerFullName,
        'CO-SSN' => coBorrowerSsn,
        'DATE OF BIRTH' => format_date(borrowerDOB),
        'ADDRESS' => propertyAddress,
        'CITY' => propertyCity,
        'STATE' => propertyState,
        'ZIPCODE' => zip,
        'PHONE NUMBER' => format_phone_number(phone)
    }
  end
end



