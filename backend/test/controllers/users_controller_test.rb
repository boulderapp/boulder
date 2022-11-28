require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:neikos)
  end

  test "should get index" do
    login_user "neikos@neikos.email", "secret"
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      password = "12345678"
      post users_url, params: { user: { password: password, password_confirmation: password, email: "test@example.com" } }
    end

    assert_redirected_to login_url
  end

  test "should show user" do
    login_user "neikos@neikos.email", "secret"
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    login_user "neikos@neikos.email", "secret"
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    login_user "neikos@neikos.email", "secret"
    patch user_url(@user), params: { user: { email: @user.email } }
    assert_redirected_to user_url(@user)
  end
end
