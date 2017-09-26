module Pages
  module ActivityLogOverlayPage

    USERSUMMARYTITLE = ".summary-section-title"
    USERSUMMARYHELP = ".summary-section .user-notes .add-note"

    def validate_activity_log_overlay
      expect(page).to have_css('.overlay-header h3')
      actual_title = page.find('.overlay-header h3').text
      raise " Activity log title not found " unless actual_title == 'ACTIVITY LOG'
    end

    def validate_activity_log_entry
      accordion_text = page.find_all('.activity-log .panel .panel-title').first.text
      expected_value = 'developer@nationstar.com completed following actions on ' + " #{Time.new.strftime("%m/%d/%Y")}"
      raise "Accordion in activity log is wrong expected: #{expected_value} but got #{accordion_text} " unless accordion_text.include?(expected_value)
      page.find_all('.activity-log .panel .panel-title').first.click

    end

    def validate_log_entry(expected)
      actual_entry = page.find_all('.activity-log table').first.find_all('tr').map do |row|
        row.find_all('td').to_a.values_at(0, 1).map(&:text)
        raise "Activity log entry does not match expected : #{expected} but got #{actual_entry}" unless expected == actual_entry
      end
    end

    def validate_step_names(expected_steps)
      actual_steps = page.find_all('.activity-log table').first.find_all('caption').collect { |e| e.text }
      raise "Step names don't match expected : #{expected_steps} but got #{actual_steps}" unless expected_steps == actual_steps
    end

    def validate_recap_title(usernote)
      expect(page).to have_css(USERSUMMARYTITLE, :visible => usernote)
    end

    def validate_recap_body(usernote)
      expect(page).to have_css(USERSUMMARYHELP, :visible => usernote)
    end

  end
end

World(Pages::ActivityLogOverlayPage)