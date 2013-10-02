class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :username, :email, :password_confirmation, :password
 	
  
 
  validates :first_name, :last_name, :username, :email, presence: :true


	has_many :projects  
  has_many :pledges

  def name
  	return "#{first_name} #{last_name}"
  end
end
