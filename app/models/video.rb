require 'carrierwave/orm/activerecord'
require_relative '../uploaders/reel_uploader'

class Video < ActiveRecord::Base
  belongs_to :user 


  mount_uploader :thumbnail, ReelUploader
end