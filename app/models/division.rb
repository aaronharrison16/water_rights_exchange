class Division < ApplicationRecord
  belongs_to :region, optional: true
  has_many :posts
end
