require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get tops" do
    get homes_tops_url
    assert_response :success
  end
end
