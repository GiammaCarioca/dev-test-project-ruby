# frozen_string_literal: true

require 'application_system_test_case'

class PagesTest < ApplicationSystemTestCase
  test 'visit home' do
    visit root_url
    assert_selector 'h1', text: 'nuuvem ☁️ File Upload'
    find('input[name="commit"]', visible: :hidden).value
  end

  test 'visit report' do
    visit report_url
    assert_selector 'h1', text: 'nuuvem ☁️ Report'
  end
end
