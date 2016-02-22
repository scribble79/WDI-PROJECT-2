class CreateVideosTable < ActiveRecord::Migration
  def change
    create_table :videos do |t|
          t.string :user_id
          t.string :video_name
          t.string :description
          t.string :url
          t.string :comments
          t.string :likes
        end
  end
end
