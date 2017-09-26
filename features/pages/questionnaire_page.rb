module Pages
  module QuestionnairePage

    PROMPT_TITLE = '.prompt-title'
    PROMPT_TEXT = '.prompt-body .body .text'
    PROMPT_TEXT_LINK = '.prompt-body .body .text>div>p'
    RELATED_INFO = '.related-information .related-information-content'
    RELATED_INFO_TITLE = '.related-information .related-information-title'
    EXPECTED_EMAIL_TEXT = '<a href="mailto:trial@gmail.com?subject=subject is here&body=this is a trial">trial</a>'
    EXPECTED_EMPTY_EMAIL_TEXT = '<a href="mailto:?subject=subject is here&body=this is a trial">trial</a>'

    def verify_steps(expected_steps)
      expect(page).to have_css('.process-tabs span')
      actual_steps = page.find_all('.process-tabs span').collect { |n| n.text }
      expected = expected_steps.rows.collect { |value| value[0] }
      raise "Steps are not configured, expected = #{expected} but got #{actual_steps}" unless actual_steps == expected
    end

    def verify_steps_availability(expected_step)
      expect(page).to have_css('.process-tabs span')
      actual_steps = page.find('.process-tabs span').text
      expected = expected_step.first[:name]
      raise "Steps are not configured, expected = #{expected} but got #{actual_steps}" unless actual_steps == expected
    end

    def verify_prompt_title(expected)
      actual_prompt = page.find(PROMPT_TITLE).text
      raise "Prompt text doesn't match, expected = #{expected.first[:title]} but got #{actual_prompt}" unless actual_prompt == expected.first[:title]
    end

    def verify_prompt_text(expected)
      actual_prompt = page.find(PROMPT_TEXT).text
      raise "Prompt title doesn't match, expected = #{expected.first[:text]} but got #{actual_prompt}" unless actual_prompt == expected.first[:text]
    end

    def verify_prompt_text_rods_format(expected)
      actual_prompt = page.find(PROMPT_TEXT).text
      expect(actual_prompt).to include(expected)
    end

    def verify_no_prompt_text
      expect(page).not_to have_css(PROMPT_TEXT)
    end

    def verify_prompt_text_rods(expected)
      actual_prompt = page.find(PROMPT_TEXT).text
      expect(actual_prompt).to include(expected.first.borrowerFirstName, expected.first.borrowerEmailId, expected.first.borrowerDOB, expected.first.economicSaveAmount, expected.first.coBorrowerHomePhoneNumber)
    end

    def verify_prompt_text_link(expected)
      actual_link = page.find(PROMPT_TEXT).text
      find_link(actual_link).visible?
      # click_link(actual_link)
      actual_prompt = find(PROMPT_TEXT_LINK)['innerHTML'].sub(('amp;'), '')
      raise "Prompt title doesn't match, expected = #{expected.first[:text]} but got #{actual_prompt}" unless actual_prompt == expected.first[:text]
    end

    def verify_prompt_text_rods_email(expected)
      actual_link = page.find(PROMPT_TEXT).text
      find_link(actual_link).visible?
      actual_prompt = find(PROMPT_TEXT_LINK)['innerHTML'].sub(('amp;'), '')
      expect(actual_prompt).to include(expected.first.borrowerFirstName, expected.first.borrowerEmailId, expected.first.borrowerDOB, expected.first.coBorrowerHomePhoneNumber)
    end

    def verify_prompt_text_rods_email_space
      actual_link = page.find(PROMPT_TEXT).text
      find_link(actual_link).visible?
      actual_prompt = find(PROMPT_TEXT_LINK)['innerHTML'].sub(('amp;'), '')
      raise "Prompt email doesn't match, expected = #{EXPECTED_EMAIL_TEXT} but got #{actual_prompt}" unless actual_prompt == EXPECTED_EMAIL_TEXT
    end

    def verify_prompt_email_float(expected)
      actual_link = page.find(PROMPT_TEXT).text
      find_link(actual_link).visible?
      actual_prompt = find(PROMPT_TEXT_LINK)['innerHTML'].sub(('amp;'), '')
      expect(actual_prompt).to include(expected.first.mostRecentAppraisalValue)
    end

    def verify_empty_email_id
      actual_link = page.find(PROMPT_TEXT).text
      find_link(actual_link).visible?
      actual_prompt = find(PROMPT_TEXT_LINK)['innerHTML'].sub(('amp;'), '')
      raise "Prompt email with NULL doesn't match, expected = #{EXPECTED_EMPTY_EMAIL_TEXT} but got #{actual_prompt}" unless actual_prompt == EXPECTED_EMPTY_EMAIL_TEXT
    end

    def verify_related_info(expected)
      actual_prompt = page.find(RELATED_INFO).text
      raise "Related information doesn't match, expected = #{expected.first[:related_information][:content]} but got #{actual_prompt}" unless actual_prompt == expected.first[:related_information][:content]
    end

    def verify_related_info_title(title)
      actual_title = page.find(RELATED_INFO_TITLE).text
      raise "Related information title doesn't match, expected = #{title} but got #{actual_title}" unless actual_title == title
    end

    def verify_response_labels(labels)
      actual_labels = page.find_all('.responses label').collect { |e| e.text }
      expected_labels = JsonPath.on(labels, '$..values').fetch(0)
      raise "Label values don't match, expected #{expected_labels} but got #{actual_labels}" unless expected_labels == actual_labels
    end

    def verify_sequence_prompt(table)
      click_button "Next"
      actual_labels = page.find_all('.prompt-title').collect { |e| e.text }
      expected_labels = labels.rows.collect { |value| value[0] }
      raise "Prompt text don't match, expected #{expected_labels} but got #{actual_labels}" unless expected_labels == actual_labels
    end

    def verify_no_response
      # page.has_no_checked_field?(find_all('.responses label').collect { |e| e.text })
      page.evaluate_script("document.getElementsByName('response1')[1].checked")
    end

    def verify_response
      # page.has_checked_field?(find_all('.responses label').collect { |e| e.text })
      page.evaluate_script("document.getElementsByName('response1')[1].checked")
    end

    def verify_response_text(text)
      actual_value = page.find('.text input').value
      raise "Text not visible, expected #{text} but got #{actual_value}" unless text == actual_value
    end

    def verify_no_response_text
      actual_value = page.find('.text input').value
      raise "Textbox not empty" unless actual_value.blank? == true
    end
  end
end
World(Pages::QuestionnairePage)