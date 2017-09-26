# require 'singleton'
#
# class Questerrepo
#   include Singleton
#
#   attr_reader :business_process
#   attr_reader :step
#   attr_reader :section
#   attr_reader :prompt
#   attr_reader :response
#
#   def initialize
#     @business_process = []
#     @step = []
#     @section = []
#     @prompt = []
#     @response = []
#   end
#
#   def clear
#     @business_process = []
#     @step = []
#     @section = []
#     @prompt = []
#     @response = []
#   end
#
#   def self.create_business_process(business_process)
#     business_process = FactoryGirl.attributes_for(:business_process)
#     QuesterService.instance.create_business_process business_process
#   end
#
#   def self.create_step (table)
#     table.hashes.each do
#     step = FactoryGirl.attributes_for(:step)
#     puts step.inspect
#     QuesterService.instance.create_step_for step
#       end
#   end
#
#   def self.create_section(section)
#     section = FactoryGirl.attributes_for(:section)
#     puts section.inspect
#     QuesterService.instance.create_section_for section
#   end
#
#   def self.create_prompt(prompt)
#     prompt = FactoryGirl.attributes_for(:prompt)
#     puts prompt.inspect
#     QuesterService.instance.create_prompt_for prompt
#   end
#
#
#   def self.create_response(response)
#     response = FactoryGirl.attributes_for(:response)
#     puts response.inspect
#     QuesterService.instance.create_response_for response
#   end
#
#   #
#   # def add_business_process(business_process)
#   #   @business_process << business_process
#   #   business_process
#   # end
# end