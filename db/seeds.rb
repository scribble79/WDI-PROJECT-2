require "carrierwave"
require "bcrypt"
require_relative "../app/models/user.rb"
require_relative "../app/models/video.rb"
require_relative "../app/models/comment.rb"

User.destroy_all
Video.destroy_all
Comment.destroy_all

[
  { 
    first_name: "Snita",
    last_name: "Bharth",
    username: "snita",
    email: "snita.bharth@gmail.com",
    image: "public/uploads/images/banksy.jpg",
    bio: "Hiya",
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
    video_name: "Camping",
    url: "public/uploads/videos/IMG_0305.MOV",
    description: "Good Vibes",
    comment: "Good vibrations"
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