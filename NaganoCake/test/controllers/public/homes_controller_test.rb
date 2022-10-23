require 'test_helper'

class Public::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get public_homes_top_url
    assert_response :success
  end

  test "should get about" do
    get public_homes_about_url
    assert_response :success
  end

end
