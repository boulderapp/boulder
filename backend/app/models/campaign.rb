class Campaign < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  has_many :villages, dependent: :destroy
  has_many :characters, dependent: :destroy
end
