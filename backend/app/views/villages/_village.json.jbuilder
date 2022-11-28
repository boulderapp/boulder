json.extract! village, :id, :campaign_id, :name, :created_at, :updated_at
json.url campaign_village_url(village.campaign, village, format: :json)
