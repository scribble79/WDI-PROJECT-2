class RemoveUrlFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :url
  end
end
