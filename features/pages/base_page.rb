# frozen_string_literal: true
module Pages
  module BasePage
    include RSpec::Matchers

    HOME_LOGO = '.navbar img'
    NEXT_BUTTON = '.next button'
    RADIO_BUTTON = '.radio'
    CHECKBOX = '.checkbox'

    def visitpage(page)
      @session = Capybara.current_session
      @session.visit("#{page}")
    end

    def has_element?(name)
      expect(page).to have_css(name)
    end

    def click_css(value)
      page.find("#{value}").click
    end

    def fill_value(location, value)
      page.find("#{location}").set value
    end

    def find_info_in_tab(tab_selector, tab_name, label_selector, value_selector)
      page.find_all('.panel h4 a ', :text => "#{tabname}")

    end

    def get_values_select
      find_response = RepositoryQuester.instance.response_data
      JsonPath.on(find_response, '$..values').fetch(0)[0]
    end

    def select_radio_button(prompt_name)
      page.find("div[id*=#{prompt_name}] .radio", :text => get_values_select).click
    end

    def select_checkbox
      page.find(CHECKBOX, :text => get_values_select).click
    end

    def select_drop_down
      page.select 'Test1', :from => '.dropdown-input .value .Select-placeholder'
    end

    def fill_text_box(answer_value)
      answer_value = nil if answer_value == ''
      page.find('.text input').set("#{answer_value}")
    end

    def return_home
      page.find(HOME_LOGO).click
    end

    def click_next
      page.find(NEXT_BUTTON).click
    end

    def validate_button(button)
      page.should have_button(button)
    end

    def validate_button_disabled(button)
      expect(page).to have_button(button, disabled: true)
    end

    def validate_button_change(button)
      page.has_content?(button)
    end

    def validate_no_button(button)
      page.should_not have_button(button)
    end

    # def label_and_value_as_hash(parent_selector, tabname, label_selector, value_selector)
    #   sections = page.find_all(parent_selector, :text => "#{tabname}")
    #   sections.each_with_object({}) do |section, result|
    #     label = section.find(label_selector).text
    #     value = section.find(value_selector).text
    #     result[label] = value
    #   end
    # end
  end
end
World(Pages::BasePage)
