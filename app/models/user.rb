class User < ApplicationRecord
  has_many :posts
  
  validates_presence_of :first_name, :last_name
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    last_name.upcase + ', ' + first_name.upcase
  end
end
