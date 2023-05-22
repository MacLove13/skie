require "test_helper"

class Api::ShouldRetainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_should_retain_index_url
    assert_response :success
  end
end
