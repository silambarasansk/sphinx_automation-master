require 'singleton'

class Repository
  include Singleton

  attr_reader :basic_loans
  attr_accessor :loans
  attr_reader :bulk_loans

  def initialize
    @basic_loans = []
    @loans = []
    @bulk_loans = []
  end

  def clear
    @basic_loans = []
    @loans = []
    @bulk_loans = []
  end

  def self.create_basic_loan(loan_number)
    basic_loan = FactoryGirl.build(:basic_loan, loanNumber: loan_number)
    self.instance.add_basic_loan basic_loan
    RodsService.instance.stub_basic_loan(loan_number, [basic_loan])
  end

  def self.create_bulk_loans(field1, field2, table)
    stub_criteria = []
    stub_response = []
    table.rows_hash.each do |table_record|
      basic_loan = {}
      similar_loan_array = []
      30.times do |index|
        basic_loan = FactoryGirl.build(:basic_loan, Hash[field1, table_record[0], field2, table_record[1]])
        # self.instance.add_bulk_basic_loan basic_loan
        similar_loan_array << basic_loan
        # populate_loan_fields(basic_loan.loanNumber)
      end
      stub_criteria << table_record[0]
      stub_criteria << table_record[1]
      stub_response << similar_loan_array
      stub_response << similar_loan_array
    end
    RodsService.instance.stub_bulk_loan(stub_criteria, stub_response)
  end

  def self.create_more_basic(query)
    bulk_loan = FactoryGirl.build_list(:basic_loan, 25)
    self.instance.add_bulk_loans bulk_loan
    RodsService.instance.stub_basic_loan(query, bulk_loan)
  end

  def self.populate_loan_fields(loan_number)
    loan = FactoryGirl.build(:loan, loanNumber: loan_number, sSDILEconomicAmount: nil)
    self.instance.add_loan loan
    RodsService.instance.stub_loan(loan_number, loan)
    end

  def self.populate_loan_for_title(loan_number, title_data)
    loan = FactoryGirl.build(:loan, loanNumber: loan_number, sSDILEconomicAmount: title_data)
    self.instance.add_loan loan
    RodsService.instance.stub_loan(loan_number, loan)
  end

  def self.create_loan_spl_cases(loan_number, indicator)
    loan = FactoryGirl.build(:loan, loanNumber: loan_number, highRisk: indicator)
    self.instance.add_loan loan
    RodsService.instance.stub_loan(loan_number, loan)
  end

  def self.create_errors
    RodsService.instance.stub_basic_loan({}, [], status_code)
  end

  def add_loan(loan)
    @loans << loan
  end

  def add_basic_loan(loan)
    clear
    @basic_loans << loan
  end

  def add_bulk_loans(loan)
    clear
    @bulk_loans << loan
    @bulk_loans.flatten!
  end

end