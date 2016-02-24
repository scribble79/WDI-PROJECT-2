require 'carrierwave/orm/activerecord'
require_relative '../uploaders/image_uploader'

class User < ActiveRecord::Base
  include BCrypt
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  has_secure_password

  has_many :videos

  mount_uploader :image, ImageUploader
end