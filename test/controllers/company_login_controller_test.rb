require 'test_helper'

class CompanyLoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_login_index_url
    assert_response :success
  end

  test "should get index" do
    get company_login_index_url
    assert_response :success
  end

  test "should get auth" do
    get company_login_auth_url
    assert_response :success
  end

  test "should get logout" do
    get company_login_logout_url
    assert_response :success
  end

end
