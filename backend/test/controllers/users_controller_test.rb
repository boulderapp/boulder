require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:neikos)
  end

  test "should get index" do
    login_user "neikos@neikos.email", "secret"
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      password = "12345678"
      post users_url, params: { user: { password: password, password_confirmation: password, email: "test@example.com" } }, as: :json
    end

    assert_response :created
  end

  test "should show user" do
    login_user "neikos@neikos.email", "secret"
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    login_user "neikos@neikos.email", "secret"
    patch user_url(@user), params: { user: { email: @user.email } }, as: :json
    assert_response :success
  end
end
