class Post < ApplicationRecord
  enum purpose: { buy: 0, sell: 1 }
  enum water_type: { acre_foot: 0, share: 1 }
  enum status: { pending: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :title, :available, :price, :address, :location, :water_type, :purpose

  scope :posts_by, ->(user) { where(user_id: user.id )}
end
