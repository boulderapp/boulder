json.extract! character, :id, :campaign_id, :name, :bio, :created_at, :updated_at
json.url campaign_character_url(character.campaign, character, format: :json)
