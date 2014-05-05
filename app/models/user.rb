class User < ActiveRecord::Base
  has_secure_password

  has_many :offenses
  has_many :comments
end
