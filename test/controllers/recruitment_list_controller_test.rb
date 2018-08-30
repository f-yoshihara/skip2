require 'test_helper'

class RecruitmentListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recruitment_list_index_url
    assert_response :success
  end

end
