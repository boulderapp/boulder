require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get login_url
    assert_response :success
  end

  test "should post login" do
    post login_url
    assert_response :success
  end

  test "should post logout" do
    post logout_url
    assert_response :redirect
  end
end
