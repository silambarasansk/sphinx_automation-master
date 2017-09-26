require 'singleton'

class RepositoryQuester
  include Singleton

  attr_reader :prompt_data
  attr_reader :step_data
  attr_reader :response_data

  def initialize
    @prompt_data = []
    @step_data = []
    @response_data = []
  end

  def clear
    @prompt_data = []
    @step_data = []
    @response_data = []
  end

  def self.create_buss_process
    business_process = FactoryGirl.attributes_for(:business_process)
    @business_process_id = business_process[:uid]
    QuesterService.instance.create_business_process business_process
  end

  def self.create_buss_processes(arg)
    business_process = FactoryGirl.attributes_for(:business_process, uid: arg)
    @business_process_id = business_process[:uid]
    QuesterService.instance.create_business_process business_process
  end

  def self.create_steps(arg1, arg2)
    step = FactoryGirl.attributes_for(:step, uid: arg1, name: arg1, order: arg2)
    self.instance.create_step_data step
    @step_id = step[:uid]
    QuesterService.instance.create_step_for(step)
    QuesterService.instance.associate_step_to_business_process(@business_process_id, step[:uid], step[:order])
  end

  def self.create_step
    step = FactoryGirl.attributes_for(:step)
    self.instance.create_step_data step
    @step_id = step[:uid]
    QuesterService.instance.create_step_for(step)
    QuesterService.instance.associate_step_to_business_process(@business_process_id, step[:uid], step[:order])
  end

  def self.create_section
    section = FactoryGirl.attributes_for(:section)
    @section_id = section[:uid]
    QuesterService.instance.create_section_for(@step_id, section)
  end

  def self.create_sections(arg1, arg2)
    section = FactoryGirl.attributes_for(:section, uid: arg1, name: arg1, order: arg2)
    @section_id = section[:uid]
    QuesterService.instance.create_section_for(@step_id, section)
  end

  def self.create_prompt
    prompt = FactoryGirl.attributes_for(:prompt)
    self.instance.create_prompt_data prompt
    @prompt_id = prompt[:uid]
    QuesterService.instance.create_prompt_for(@step_id, @section_id, prompt)
  end

  def self.create_prompts(arg1, arg2)
    prompt = FactoryGirl.attributes_for(:prompt, uid: arg1, title: arg1.capitalize, display_title: arg1.capitalize, order: arg2)
    self.instance.create_prompt_data prompt
    @prompt_id = prompt[:uid]
    QuesterService.instance.create_prompt_for(@step_id, @section_id, prompt)
  end

  def self.create_prompt_spl_case(data)
    prompt_spl = FactoryGirl.attributes_for(:prompt, data)
    self.instance.create_prompt_data prompt_spl
    @prompt_id = prompt_spl[:uid]
    QuesterService.instance.create_prompt_for(@step_id, @section_id, prompt_spl)
  end

  def self.create_responses(type, uid, num, property)
    response = FactoryGirl.attributes_for(:response, input_type: type, uid: uid, order: num, properties: property)
    self.instance.create_response_data response
    @response_id = response[:uid]
    QuesterService.instance.create_response_for(@step_id, @section_id, @prompt_id, response)
  end

  def create_step_data(data)
    clear
    @step_data << data
  end

  def create_prompt_data(data)
    @prompt_data << data
  end

  def create_response_data(data)
    @response_data << data
  end
end
