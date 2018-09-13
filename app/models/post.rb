class Post < ApplicationRecord
  validates_presence_of :title, :available, :price, :address, :location
end
