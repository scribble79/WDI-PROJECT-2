      class ChangeColumnCommentsFromtstringToArraytrue
@
 < ActiveRecord::Migration
        def change
          change_table(:videos) do |t|
            t.column :comments, :string, array: true
            # Other column alterations here
          end
        end
      end
