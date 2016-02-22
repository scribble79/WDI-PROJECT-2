class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
          t.string :username
          t.string :first_name
          t.string :last_name
          t.string :email
          t.string :image
          t.string :bio
          t.string :url
        end
  end
end
