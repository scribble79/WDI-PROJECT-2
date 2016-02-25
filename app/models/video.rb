require 'carrierwave/orm/activerecord'
require_relative '../uploaders/video_uploader'

class Video < ActiveRecord::Base
  belongs_to :user 
  has_many :comments
  
  mount_uploader :url, VideoUploader
end