# frozen_string_literal: true

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'can get home' do
    get root_url
    assert_response :success
  end

  test 'can submit form' do
    post root_url
    assert_response :redirect
    assert_redirected_to controller: 'pages', action: 'upload'
  end

  test 'can get report' do
    get report_url
    assert_response :success
    assert_select 'div.wrapper-result'
    assert_select 'a[href=?]', '/'
  end
end
