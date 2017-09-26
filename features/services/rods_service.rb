# frozen_string_literal: true
class RodsService
  include Singleton

  def initialize
    @port = 8090
    @protocol = Mountebank::Imposter::PROTOCOL_HTTP
  end

  def initialize_imposter
    @imposter = Mountebank::Imposter.build(@port, @protocol)
  end

  def stub_basic_loan(criteria, loans, status_code = 200)
    initialize_imposter
    predicate = Mountebank::Stub::Predicate.new(equals: {path: '/loans/search_all', query: { 'query': criteria }})
    response = Mountebank::Stub::HttpResponse.create(status_code, {'Content-Type': 'application/json'}, loans.to_json)
    @imposter.add_stub(response, predicate)
    @imposter.save!
  end

  def stub_loan(loan_number, loan)
    @loan[loan_number] = loan
  end

  def add_latest_transaction_details(loan_number, latest_transaction)
    loan = @loan[loan_number]
    @loan[loan_number] = loan.merge('latestTransaction': latest_transaction)
  end

  def add_alternate_contact_details(loan_number, alternate_contacts)
    loan = @loan[loan_number]
    @loan[loan_number] = loan.merge('alternateContacts': alternate_contacts)
    end

  def add_nonborrowingspouse_details(loan_number, alternate_contacts)
    loan = @loan[loan_number]
    @loan[loan_number] = loan.merge('nonBorrowerSpouse': alternate_contacts)
  end

  def save
    @loan.each do |loan_number, data|
      predicate = Mountebank::Stub::Predicate.new(equals: {path: "/loans/#{loan_number}"})
      response = Mountebank::Stub::HttpResponse.create(200, {'Content-Type': 'application/json'}, data.to_json)
      @imposter.add_stub(response, predicate)
    end
  end

  def stub_bulk_loan(criteria, loans, status_code = 200)
    initialize_imposter
    if criteria.length == loans.length
      criteria.length.times do |index|
        predicate = Mountebank::Stub::Predicate.new(equals: {path: '/loans/search_all', query: { 'query': criteria[index] }})
        response = Mountebank::Stub::HttpResponse.create(status_code, {'Content-Type': 'application/json'}, loans[index].to_json)
        @imposter.add_stub(response, predicate)
        @imposter.save!
      end
    end
  end


  def stub_loan(loans, data, status_code = 200)
    predicate = Mountebank::Stub::Predicate.new(equals: {path: "/loans/#{loans}" })
    response = Mountebank::Stub::HttpResponse.create(status_code, {'Content-Type': 'application/json'}, data.to_json)
    @imposter.add_stub(response, predicate)
    @imposter.save!
  end

  def stub_loan(loans, data, status_code = 200)
    predicate = Mountebank::Stub::Predicate.new(equals: {path: "/loans/#{loans}" })
    response = Mountebank::Stub::HttpResponse.create(status_code, {'Content-Type': 'application/json'}, data.to_json)
    @imposter.add_stub(response, predicate)
    @imposter.save!
  end
end
