require "test_helper"

class FollowshipControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get followship_index_url
    assert_response :success
  end
end
