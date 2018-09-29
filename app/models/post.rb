class Post < ApplicationRecord
  enum status: { pending: 0, approved: 1, rejected: 2 }
  enum purpose: { buy: 0, sell: 1 }
  belongs_to :user
  validates_presence_of :title, :available, :price, :address, :location
end
