class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, index: true, null: false
      t.integer :votable_id, polymorphic: true, index: true, null: false
      t.string :votable_type, polymorphic: true, null: false
      t.integer :direction null: false

      t.timestamps null: false
    end
  end
end
