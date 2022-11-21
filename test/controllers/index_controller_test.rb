require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    login_user "neikos@neikos.email", "secret"

    get root_url
    assert_response :success
  end
end
