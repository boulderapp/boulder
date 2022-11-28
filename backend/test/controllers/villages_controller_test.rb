require "test_helper"

class VillagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @village = villages(:stonetop)
    @campaign = @village.campaign
    login_user "neikos@neikos.email", "secret"
  end

  test "should get index" do
    get campaign_villages_url(@campaign), as: :json
    assert_response :success
  end

  test "should create village" do
    assert_difference("Village.count") do
      post campaign_villages_url(@campaign), params: { village: { campaign_id: @village.campaign_id, name: @village.name } }, as: :json
    end

    assert_response :created
  end

  test "should show village" do
    get campaign_village_url(@campaign, @village), as: :json
    assert_response :success
  end

  test "should update village" do
    patch campaign_village_url(@campaign, @village), params: { village: { name: @village.name } }, as: :json
    assert_response :success
  end

  test "should destroy village" do
    assert_difference("Village.count", -1) do
      delete campaign_village_url(@campaign, @village), as: :json
    end

    assert_response :no_content
  end
end
