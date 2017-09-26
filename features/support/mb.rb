# frozen_string_literal: true
require 'mountebank'

Dir[File.join(__FILE__, '../services/*.rb')].each {|service| require service }
