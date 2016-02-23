require "carrierwave"
require "bcrypt"
require_relative "../app/models/user.rb"
require_relative "../app/models/video.rb"

User.destroy_all
Video.destroy_all

[
  { 
    first_name: "Snita",
    last_name: "Bharth",
    username: "snita",
    email: "snita.bharth@gmail.com",
    image: "http://t2.gstatic.com/images?q=tbn:ANd9GcRIiu_Tkn8HFUCeI0xElCJ6z2I9_LFob9Wx9GyTu7nseMsASMV5Ug",
    bio: "Lorem ipsum",
    password: "password"
  },
  {
    first_name: "Ollie",
    last_name: "Holden",
    username: "ollie",
    email: "ollie.holden@gmail.com",
    image: "http://trace.tv/wp-content/uploads/2015/06/snoop-dogg.jpg",
    bio: "Lorem ipsum",
    password: "password"
  }
].each do |user|
  User.create!(user)
end

[
  { 
    user_id: User.last.id,
    video_name: "Hotline Bling",
    url: "uxpDa-c-4Mc",
    description: "Lorem ipsum"
   },
   {
    user_id: User.first.id,
    video_name: "Hello",
    url: "YQHsXMglC9A",
    description: "Lorem ipsum"
   }
].each do |video|
  Video.create!(video)
end