require 'test_helper'

class Panel::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get panel_dashboard_index_url
    assert_response :success
  end

end
