class Character < ApplicationRecord
  belongs_to :campaign

  has_rich_text :bio
end
