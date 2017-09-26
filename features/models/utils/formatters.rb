module Formatters
  def format_phone_number(phone)
    prefix, num_1, num_2 = phone.unpack('A3A3A4')
    "(#{prefix})-#{num_1}-#{num_2}"
  end

  def format_phone_inside_array(phone)
    prefix, num_1, num_2 = phone.first.unpack('A3A3A4')
    "(#{prefix})-#{num_1}-#{num_2}"
  end

  def format_date(date)
    Date.parse(date.to_s).strftime('%m/%d/%Y')
  end

  def format_currency(currency)
    ActiveSupport::NumberHelper::number_to_currency(currency,:precision => 2)
  end

  def format_negative_currency(currency)
    ActiveSupport::NumberHelper::number_to_currency(currency, :negative_format => '(%u%n)')
  end

  def format_percentage(percentage)
    "#{ActiveSupport::NumberHelper::number_to_percentage(percentage, precision: 2).chomp('%')} %"
  end

  def format_ssn(ssn)
    ssn = ssn.unpack('A3A2A4')[2]
    "XXX-XX-#{ssn}"
  end
end