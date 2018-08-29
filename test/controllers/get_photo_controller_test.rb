require 'test_helper'

class GetPhotoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get get_photo_index_url
    assert_response :success
  end

end
