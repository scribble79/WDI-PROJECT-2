require_relative "../models/user.rb"
require_relative "../models/video.rb"

User.destroy_all
Video.destroy_all

[
  { 
    username: "Snita", 
    photo_url: "http://t2.gstatic.com/images?q=tbn:ANd9GcRIiu_Tkn8HFUCeI0xElCJ6z2I9_LFob9Wx9GyTu7nseMsASMV5Ug", 
    nationality: "British"
  },
  {
    username: "Ollie",
    photo_url: "http://trace.tv/wp-content/uploads/2015/06/snoop-dogg.jpg",
    nationality: "Goonies"
  }
].each do |user|
  User.create!(user)
end

[
  { user_id: "user/1",
    video_name: "word"
   }
].each do |video|
  Video.create!(video)
end