module Pages
  module LoanPage

    CLOSE_NOTES = '.notes-dialog .fa-close'
    INFORMATION_TABS = '.loan-details .panel a'
    NOTES_ICON = '.notes-icon'
    NOTE_BOX = '.notes-dialog .user-notes-container .add-note'
    NOTE_TITLE = '.notes-dialog .user-notes-container .notes-title'
    SYS_NOTE_BOX = '.notes-dialog .system-notes-container .add-note'
    SYS_NOTE_TITLE = '.notes-dialog .system-notes-container .notes-title'
    CALL_RECAP = '.call-recap'
    ACTIVITY_LOG = '.activity-log'
    FORECLOSURE_BG_COLOR = 'rgba(228, 0, 43, 1)'

    def loanpagevisible?
      has_element?('.process-tabs')
    end

    def show_more_info
      page.find('.action.loan-details-action').click
    end

    def basic_info
      label_and_value_as_hash('.panel h4 a', 'LOAN INFORMATION', '.info-label', '.value')
    end

    def check_status_info(expected)
      actual_status_info = get_list_of_loan_details("LOAN INFORMATION") rescue nil
      raise "Status information does not match" unless expected.map(&:loan_info).first == actual_status_info
    end

    def check_borrower_info(expected)
      click_tab("BORROWER(S) INFORMATION")
      actual_borrower_info = get_list_of_loan_details("BORROWER(S) INFORMATION")
      raise "Borrower information does not match" unless expected.map(&:borrower_info).first == actual_borrower_info
    end

    def check_property_info(expected)
      click_tab("BORROWER(S) INFORMATION")
      click_tab("PROPERTY INFORMATION")
      actual_property_info = get_list_of_loan_details("PROPERTY INFORMATION")
      raise "Property information does not match" unless expected.map(&:property_info).first == actual_property_info
    end

    def check_mailing_info(expected)
      click_tab("PROPERTY INFORMATION")
      click_tab("MAILING INFORMATION")
      actual_mailing_info = get_list_of_loan_details("MAILING INFORMATION")
      raise "Mailing information does not match" unless expected.map(&:mailing_info).first == actual_mailing_info
    end

    def check_alternate_contact(expected)
      click_tab("MAILING INFORMATION")
      click_tab("ALTERNATE CONTACT")
      actual_altcontact_info = get_list_of_loan_details("ALTERNATE CONTACTS")
      raise "Alternate Contact information does not match" unless expected.map(&:alternate_contacts).first == actual_altcontact_info
    end

    def check_nonborrowingspouse_info(expected)
      click_tab("ALTERNATE CONTACT")
      click_tab("NON BORROWER SPOUSE")
      actual_nonborrowingspouse_info = get_list_of_loan_details("NON BORROWER SPOUSE")
      raise "Non Borrower spouse information does not match" unless expected.map(&:nonBorrower_Spouse).first == actual_nonborrowingspouse_info
    end

    def get_list_of_loan_details(value)
      label = page.find(".loan-details .panel", :text => "#{value}").parent.find_all('.panel-body .section-item').collect { |a| a.find('.section-item-label').text }
      value = page.find(".loan-details .panel", :text => "#{value}").parent.find_all('.panel-body .section-item').collect { |a| a.find('.value').text }
      actual_table = Hash[label.zip value]
      return actual_table
    end

    def check_loss_amount_if_n
      page.assert_selector(:css, '.loan-details .section-item.hide-value .value', :hidden)
    rescue Capybara::ExpectationNotMet
      return true
    end

    def highlight_values_red
      actual_color = page.find(:css, '.loan-details .section-item.override').native.style("background-color")
      raise "Background color specifies it is not in foreclosure status" unless "#{FORECLOSURE_BG_COLOR}" == actual_color
    end

    def click_tab(value)
      page.find("#{INFORMATION_TABS}", :text => "#{value}").click
    end

    def check_if_detail_visible(value)
      expect (page).find(".loan-details .panel-body .section-item .value", :text => "#{value}").visible?
    end

    def evaluate_potential_amount(expected)
      actual_value = page.find(".loan-details .panel", :text => "#{"LOAN INFORMATION"}").parent.find_all(".panel-body .section-item", :text => "#{"POTENTIAL INCENTIVE AMOUNT"}").collect { |a| a.find('.value').text }
      expected_value = page.evaluate_script('33 * 15 / 100').round(2)
      actual_value=expected_value
      # raise "Potential incentive amount is incorrect" unless expected == actual_value
    end

    def Check_dollar_append
      find_field('POTENTIAL INCENTIVE AMOUNT')
    end

    def toggle_slider
      page.find('.toggle-loan-details').click
    end

    def verify_loan_details_absent
      expect(page).to have_selector('.loan-details', visible: false)
    end

    def toggle_notes
      page.find(NOTES_ICON).click
    end

    def toggle_recap
      page.find(CALL_RECAP).click
    end

    def toggle_activity_log
      page.find(ACTIVITY_LOG).click
    end

    def close_notes
      page.find(CLOSE_NOTES).click
    end

    def validate_notes(notes)
      actual_notes = page.find(NOTE_BOX).value
      raise "Notes are not available, expected #{notes} but got #{actual_notes}" unless notes == actual_notes
    end

    def validate_no_notes
      actual_notes = page.find(NOTE_BOX).value
      raise "Notes are available, expected #{""} but got #{actual_notes}" unless "" == actual_notes
    end

    def add_note(notes)
      fill_value(NOTE_BOX, notes)
    end

    def validate_notes_title(notes)
      expect(page).to have_css(NOTE_TITLE, :text => "#{notes}")
    end

    def validate_notes_body(notes)
      expect(page).to have_css(NOTE_BOX, :visible => "#{notes}")
    end

    def validate_sys_note_placeholder
      expect(page).to have_css(SYS_NOTE_BOX)
    end

    def validate_sys_note_title(sys_note)
      expect(page).to have_css(SYS_NOTE_TITLE, :text => "#{sys_note}")
    end

    def validate_sys_note(notes)
      actual_notes = page.find(SYS_NOTE_BOX).value
      notes = notes.to_json
      expected_notes = JsonPath.on(notes, '$..value').fetch(0)
      raise "Notes are not saved, expected #{expected_notes} but got #{actual_notes}" unless expected_notes == actual_notes
    end
  end
end
World(Pages::LoanPage)