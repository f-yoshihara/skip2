require 'test_helper'

class StaffSignupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_signup_index_url
    assert_response :success
  end

end
