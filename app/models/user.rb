class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin, :guest], multiple: false)                             ##
  ############################################################################################ 
 

  has_many :posts
  
  validates_presence_of :first_name, :last_name, :phone
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    last_name.upcase + ', ' + first_name.upcase
  end
end
