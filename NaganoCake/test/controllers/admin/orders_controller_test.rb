require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_orders_show_url
    assert_response :success
  end

end
