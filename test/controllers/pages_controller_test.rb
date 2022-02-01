# frozen_string_literal: true

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "can get home" do
    get root_url
    assert_response :success
  end

  test "can send form" do
    post root_url
    assert_response :redirect
  end

  test "can get report" do
    get report_url
    assert_response :success
  end
end
