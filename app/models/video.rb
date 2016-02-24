require 'carrierwave/orm/activerecord'
require_relative '../uploaders/video_uploader'

class Video < ActiveRecord::Base
  belongs_to :user 
  
  mount_uploader :url, VideoUploader
end