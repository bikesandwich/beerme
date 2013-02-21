class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :user_name, :user_type
  
  has_secure_password
  has_many :check_in
end
