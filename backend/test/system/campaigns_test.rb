require "application_system_test_case"

class CampaignsTest < ApplicationSystemTestCase
  setup do
    @campaign = campaigns(:one)
  end

  test "visiting the index" do
    visit campaigns_url
    assert_selector "h1", text: "Campaigns"
  end

  test "should create campaign" do
    visit campaigns_url
    click_on "New campaign"

    fill_in "Name", with: @campaign.name
    fill_in "Owner", with: @campaign.owner_id
    click_on "Create Campaign"

    assert_text "Campaign was successfully created"
    click_on "Back"
  end

  test "should update Campaign" do
    visit campaign_url(@campaign)
    click_on "Edit this campaign", match: :first

    fill_in "Name", with: @campaign.name
    fill_in "Owner", with: @campaign.owner_id
    click_on "Update Campaign"

    assert_text "Campaign was successfully updated"
    click_on "Back"
  end

  test "should destroy Campaign" do
    visit campaign_url(@campaign)
    click_on "Destroy this campaign", match: :first

    assert_text "Campaign was successfully destroyed"
  end
end
