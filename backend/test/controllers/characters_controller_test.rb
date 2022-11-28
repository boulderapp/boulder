require "test_helper"

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:thomas)
    @campaign = @character.campaign
    login_user "neikos@neikos.email", "secret"
  end

  test "should get index" do
    get campaign_characters_url(@campaign), as: :json
    assert_response :success
  end

  test "should create character" do
    assert_difference("Character.count") do
      post campaign_characters_url(@campaign), params: { character: { bio: @character.bio, name: @character.name } }, as: :json
    end

    assert_response :created
  end

  test "should show character" do
    get campaign_character_url(@campaign, @character), as: :json
    assert_response :success
  end

  test "should update character" do
    patch campaign_character_url(@campaign, @character), params: { character: { bio: @character.bio, campaign_id: @character.campaign_id, name: @character.name } }, as: :json
    assert_response :success
  end

  test "should destroy character" do
    assert_difference("Character.count", -1) do
      delete campaign_character_url(@campaign, @character), as: :json
    end

    assert_response :no_content
  end
end
