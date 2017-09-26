# frozen_string_literal: true
module Pages
  module SearchPage
    require 'capybara/rspec'
    SEARCH_FIELD = '#query'

    def visit_search_page
      visitpage('/')
    end

    def visible?
      expect(page).to have_css('.search-loan')
    end

    def search_with(query)
      has_element?(SEARCH_FIELD)
      fill_value(SEARCH_FIELD, query)
    end

    def verify_base_page
      has_element?(SEARCH_FIELD)
    end

    def check_results(expected)
      expect_to_have_search_results
      raise 'Results are not as expected' unless expected.map(&:basic_loan_page) == get_results
    end

    def check_paginated_results(active_page)
      expect_to_have_pagination_bar
      raise 'Pagination Default-Page is not as expected' unless active_page == fetch_active_page_number
    end

    def get_results
      result_header = page.find_all('.dashboard .z-column-header').map(&:text)
      page.find_all('.loans-datagrid-row').map do |table_body_row|
        result_row = table_body_row.find_all('.z-cell').map(&:text)
        Hash[result_header.zip(result_row)]
      end
    end

    def fetch_active_page_number
      page.find('.datagrid-footer .pagination .active').text
    end

    def validate_error_message(error, icon)
      raise "Error not available" unless page.find('.error', visible: true).text == (error)
    end

    def enter_data_error_validation
      raise "Search error does not match" unless page.find('.help-block').text == "Please enter a search term"
    end

    def click_search_button
      click_css('.search-loan .fa-search')
    end

    def click_pagination_button(button)
      case button
        when 'next' then
          begin
            nextButton = page.find('.datagrid-footer .pagination', :text => 'Next')
            nextButton.click
          rescue Exception => msg
            raise "Next button disabled/not-found in pagination"
          end
        when 'previous' then
          begin
            previousButton = page.find('.datagrid-footer .pagination', :text => 'Previous')
            previousButton.click
          rescue Exception => msg
            raise "Previous button disabled/not-found in pagination"
          end
        when button.to_i > 0
        else
          raise "Invalid Button Click in Pagination"
      end
    end

    def select_result_with_loan_number(loan_number)
      expect_to_have_search_results
      loans = page.find_all('.dashboard .loans-datagrid-row')
      loan = loans.find { |loan| loan.find('.loan-number').text.eql?(loan_number) }
      loan.click
    end

    def verify_no_sort
      page.should_not have_css('.z-icon-sort-info')
    end

    def verify_sort_click(sort_value)
      find('.dashboard .z-header .z-content', :text => /^#{sort_value}$/).click
    end

    def verify_sort_ascending(expected, query)
      expect_to_have_search_results
      expected_result = expected.map(&:basic_loan_page).each_with_index.sort_by { |x, index| [x[query], index] }.map(&:first).take(10)
      raise 'Results are not as expected' unless expected_result == get_results
    end

    def verify_sort_ascending_int(expected, query)
      expect_to_have_search_results
      expected_result = expected.map(&:basic_loan_page).sort_by { |x| x[query].to_i }.take(10)
      raise 'Results are not as expected' unless expected_result == get_results
    end

    def verify_sort_ascending_date(expected)
      expect_to_have_search_results
      expected_result = expected.sort_by { |x| x.borrowerDOB}.map(&:basic_loan_page).take(10)
      raise 'Results are not as expected' unless expected_result == get_results
    end

    def verify_sort_descending(expected, query)
      expect_to_have_search_results
      expected_result = expected.map(&:basic_loan_page).each_with_index.sort_by { |x, index| [x[query],index] }.map(&:first).reverse.take(10)
      raise 'Results are not as expected' unless expected_result == get_results
    end

    def verify_sort_descending_int(expected, query)
      expect_to_have_search_results
      expected_result = expected.map(&:basic_loan_page).sort_by{ |x| x[query].to_i }.reverse.take(10)
      raise 'Results are not as expected' unless expected_result == get_results
    end

    def verify_sort_descending_date(expected)
      expect_to_have_search_results
      expected_result = expected.sort_by { |x| x.borrowerDOB}.reverse.map(&:basic_loan_page).take(10)
      raise 'Results are not as expected' unless expected_result == get_results
    end

    private

    def expect_to_have_search_results
      has_element?('.dashboard .z-column-header')
      has_element?('.dashboard .loans-datagrid-row')
    end

    def expect_to_have_pagination_bar
      has_element?('.datagrid-footer .pagination .active')
    end
  end
end
World(Pages::SearchPage)
