class Post < ApplicationRecord
  enum purpose: { buy: 0, sell: 1 }
  enum status: { pending: 0, approved: 1, rejected: 2 }
  enum water_type: { acre_foot: 0, share: 1 }
  belongs_to :user
  validates_presence_of :title, :available, :price, :address, :location, :purpose, :water_type

  scope :posts_by, ->(user) { where(user_id: user.id )}
end
