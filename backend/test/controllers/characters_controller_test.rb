require "test_helper"

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:thomas)
    @campaign = @character.campaign
    login_user "neikos@neikos.email", "secret"
  end

  test "should get index" do
    get campaign_characters_url(@campaign)
    assert_response :success
  end

  test "should get new" do
    get new_campaign_character_url(@campaign)
    assert_response :success
  end

  test "should create character" do
    assert_difference("Character.count") do
      post campaign_characters_url(@campaign), params: { character: { bio: @character.bio, name: @character.name } }
    end

    assert_redirected_to campaign_character_url(@campaign, Character.last)
  end

  test "should show character" do
    get campaign_character_url(@campaign, @character)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_character_url(@campaign, @character)
    assert_response :success
  end

  test "should update character" do
    patch campaign_character_url(@campaign, @character), params: { character: { bio: @character.bio, campaign_id: @character.campaign_id, name: @character.name } }
    assert_redirected_to campaign_character_url(@campaign, @character)
  end

  test "should destroy character" do
    assert_difference("Character.count", -1) do
      delete campaign_character_url(@campaign, @character)
    end

    assert_redirected_to campaign_characters_url(@campaign)
  end
end
