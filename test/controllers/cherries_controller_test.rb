require "test_helper"

class CherriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cherries_index_url
    assert_response :success
  end
end
