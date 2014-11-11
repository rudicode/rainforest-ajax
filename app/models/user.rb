class User < ActiveRecord::Base
  has_many :reviews
  has_many :products, through: :reviews  

  has_secure_password
  # creates attr_accessors :password, :password_confirmation
  # and validations to match: :password, :password_confirmation

  #validations
  validates :email, uniqueness: { case_sensitive: false }

end
