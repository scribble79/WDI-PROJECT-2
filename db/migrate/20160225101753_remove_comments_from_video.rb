class RemoveCommentsFromVideo < ActiveRecord::Migration
  def change
    remove_column :videos, :comments
  end
end
