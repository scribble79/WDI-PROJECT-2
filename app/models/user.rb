class User < ActiveRecord::Base
  include BCrypt
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password

  has_many :videos
end