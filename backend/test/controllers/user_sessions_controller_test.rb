require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should post login" do
    post login_url, params: { email: users(:neikos).email, password: "secret" }, as: :json
    assert_response :success
  end

  test "should post logout" do
    post logout_url, as: :json
    assert_response :redirect
  end
end
