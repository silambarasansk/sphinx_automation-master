module Pages
  module RecapPage

    END_CALL = '.summary button'
    RECAP_USER_NOTE = '.summary-section .add-note'
    RECAP_SYS_NOTE = '.summary-section>p'


    def verify_recap_screen
      page.should have_content('CALL RECAP')
    end

    def validate_recap_notes(expected_notes)
      actual_notes = page.find(RECAP_USER_NOTE).value
      raise "User Notes are not available in recap page, expected #{expected_notes} but got #{actual_notes}" unless expected_notes == actual_notes
    end

    def validate_recap_sys_notes(expected)
      actual_notes = page.find(RECAP_SYS_NOTE).text
      notes = expected.to_json
      expected_notes = JsonPath.on(notes, '$..value').fetch(0)
      raise "System Notes are not saved, expected #{expected_notes} but got #{actual_notes}" unless expected_notes == actual_notes
    end

    def edit_recap_notes(notes)
      page.find(RECAP_USER_NOTE).set notes
    end

    def end_call
      page.find(END_CALL).click
    end

    def validate_call_completion(title)
      page.should have_content(title)
    end

    def validate_call_completion_task(title)
      page.should have_content(title)
    end

    def validate_copy
      element.send_keys [:control, 'a']
      find("#element_id").native.send_keys :tab
    end

    def validate_system_user_note(user_note, system_notes)
      actual_notes = find('.call-details-container .call-ended-notes').text
      notes = system_notes.to_json
      expected_notes = JsonPath.on(notes, '$..value').fetch(0) + ' ' + user_note
      raise "System notes is not appended with user notes, expected #{expected_notes} but got #{actual_notes}" unless expected_notes == actual_notes
    end
  end
end
World(Pages::RecapPage)