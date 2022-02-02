# frozen_string_literal: true

require 'test_helper'

class UploadFileTest < ActionDispatch::IntegrationTest
  test 'can upload file' do
    file = fixture_file_upload('example_input.tab')
    post '/',
         params: { file: file },
         headers: { 'content-type': 'multipart/form-data' }
    assert_redirected_to report_url
  end

  test 'should create new purchases' do
    file = fixture_file_upload('example_input.tab')
    assert_difference('Purchase.count', 3) do
      post root_url,
           params: { file: file },
           headers: { 'content-type': 'multipart/form-data' }
    end
    assert_response :redirect
  end
end
