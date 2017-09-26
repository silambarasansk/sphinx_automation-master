# frozen_string_literal: true
class QuesterService
  include Singleton

  QUESTER_API_TOKEN = "81d8227374a029ffd8f1acbe792e42a8"

  def initialize
    @port = 3000
    @host = 'localhost'
  end

  def clear_data
    delete_all_data
  end

  def create_business_process(business_process)
    delete_business_process business_process
    uri = URI::HTTP.build(host: @host, port: @port, path: '/business_processes')
    new_business_process = {business_process: business_process}
    post(uri, new_business_process)
  end

  def create_step_for(step)
    delete_step(step)
    uri = URI::HTTP.build(host: @host, port: @port, path: '/steps')
    new_step = {step: step}
    post(uri, new_step)
  end

  def create_section_for(step, section)
    delete_section(section, step)
    uri = URI::HTTP.build(host: @host, port: @port, path: "/steps/#{step}/sections")
    new_section = {section: section}
    post(uri, new_section)
  end

  def create_prompt_for(step, section, prompt)
    delete_prompt(step, section, prompt)
    uri = URI::HTTP.build(host: @host, port: @port, path: "/steps/#{step}/sections/#{section}/prompts")
    new_prompt = {prompt: prompt}
    post(uri, new_prompt)
  end

  def create_response_for(step, section, prompt, response)
    delete_response(step, section, prompt, response)
    uri = URI::HTTP.build(host: @host, port: @port, path: "/steps/#{step}/sections/#{section}/prompts/#{prompt}/response")
    new_response = {response: response}
    post(uri, new_response)
  end

  def associate_step_to_business_process(business_process, step, sequence)
    uri = URI::HTTP.build(host: @host, port: @port, path: "/business_processes/#{business_process}/steps")
    step = {step: step, order: sequence}
    post(uri, step)
  end

  private

  def authorization_token
    "Token token=#{QUESTER_API_TOKEN}"
  end

  def post(uri, new_business_process)
    RestClient.post(uri.to_s, new_business_process.to_json, {content_type: 'application/json', Authorization: authorization_token})
  end

  def delete(uri)
    RestClient.delete uri.to_s, {Authorization: authorization_token}
  end

  def delete_all_data
    uri = URI::HTTP.build(host: @host, port: @port, path: '/clear_data')
    delete(uri)
  end

  def delete_business_process(business_process)
    uri = URI::HTTP.build(host: @host, port: @port, path: "/business_processes/#{business_process[:uid]}")
    delete(uri)
  rescue
      # ignored
  end


  def delete_step(step)
    uri = URI::HTTP.build(host: @host, port: @port, path: "/steps/#{step[:uid]}")
    delete(uri)
  rescue
      # ignored
  end

  def delete_prompt(step, section, prompt)
    uri = URI::HTTP.build(host: @host, port: @port, path: "/steps/#{step}/sections/#{section}/prompts/#{prompt[:uid]}")
    delete(uri)
  rescue
      # ignored
  end

  def delete_response(step, section, prompt, response)
    uri = URI::HTTP.build(host: @host, port: @port, path: "/steps/#{step}/sections/#{section}/prompts/#{prompt}/response/#{response[:uid]}")
    delete(uri)
  rescue
      # ignored
  end

  def delete_section(section, step)
    uri = URI::HTTP.build(host: @host, port: @port, path: "/steps/#{step}/sections/#{section[:uid]}")
    delete(uri)
  rescue
      # ignored
  end

end
