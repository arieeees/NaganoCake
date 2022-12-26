require "test_helper"

class Public::SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get public_searchs_search_url
    assert_response :success
  end
end
