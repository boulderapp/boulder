require "test_helper"

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign = campaigns(:simple_campaign)
    login_user "neikos@neikos.email", "secret"
  end

  test "should get index" do
    get campaigns_url, as: :json
    assert_response :success, as: :json
  end

  test "should create campaign" do
    assert_difference("Campaign.count") do
      post campaigns_url, params: { campaign: { name: @campaign.name, owner_id: @campaign.owner_id } }, as: :json
    end

    assert_response :created
  end

  test "should show campaign" do
    get campaign_url(@campaign), as: :json
    assert_response :success
  end

  test "should update campaign" do
    patch campaign_url(@campaign), params: { campaign: { name: @campaign.name, owner_id: @campaign.owner_id } }, as: :json
    assert_response :success
  end

  test "should destroy campaign" do
    assert_difference("Campaign.count", -1) do
      delete campaign_url(@campaign), as: :json
    end

    assert_response :no_content
  end
end
