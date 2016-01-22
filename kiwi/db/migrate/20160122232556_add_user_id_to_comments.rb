class AddUserIdToComments < ActiveRecord::Migration
  def change
     add_column :comments, :user_id, :integer, null: false, index: true, foreign_key: true
  end
end
