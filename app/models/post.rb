class Post < ApplicationRecord
  enum sale_status: { sale_pending: 0, sold: 1}
  enum purpose: { buy: 0, sell: 1 }
  enum water_type: { acre_foot: 0, share: 1 }
  enum status: { pending: 0, approved: 1, rejected: 2 }
  belongs_to :user, optional: true
  belongs_to :region, optional: true
  belongs_to :division, optional: true
  validates_presence_of :title, :available, :price, :address, :water_type, :purpose, :division_id, :region_id

  scope :posts_by, ->(user) { where(user_id: user.id )}

  def self.recent
    order("created_at DESC")
  end

  def self.recent_update
    order("updated_at DESC")
  end  
end