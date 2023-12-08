require "test_helper"

class CastlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get castles_index_url
    assert_response :success
  end
end
