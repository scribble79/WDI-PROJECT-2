class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
          t.string :video_id
          t.string :comment
        end
  end
end
