class Region < ApplicationRecord
  has_many :divisions
  has_many :posts
end
