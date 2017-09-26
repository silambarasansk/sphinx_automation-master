# frozen_string_literal: true
# frozen_string_literal: true

class String
  def to_underscore!
    gsub!(/(.)([A-Z])/, '\1_\2')
    downcase!
  end

  def to_underscore
    dup.tap(&:to_underscore!)
  end
end

Before do
  is_selenium = Capybara.page.driver.is_a?(Capybara::Selenium::Driver)
  Capybara.page.driver.browser.manage.window.resize_to(1280, 768) if is_selenium
end

# Before do |scenario|
#   # The +scenario+ argument is optional, but if you use it, you can get the title,
#   # description, or name (title + description) of the scenario that is about to be
#   # executed.
#   # FactoryGirl.reload
#   # Factory.reset_sequences
#   QuesterService.instance.clear_data
#   "Starting scenario: #{scenario.name}"
# end