class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false, limit: 200
      t.integer :commentable_id,  polymorphic: true, index: true null: false
      t.string :commentable_type,  polymorphic: true, null:false

      t.timestamps null: false
    end
  end
end
