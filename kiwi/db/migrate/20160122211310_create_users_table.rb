class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users_tables do |t|
      t.string  :name, null: false, unique: true, limit: 20
      t.string  :email, null: false, unique: true
      t.string  :password_digest, null: false

      t.timestamps  null: false
    end
  end
end
