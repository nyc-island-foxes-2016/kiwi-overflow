class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content, presence: true
      t.integer :user_id, index: true, foreign_key: true, presence: true
      t.integer :question_id, index: true, foreign_key: true, presence: true

      t.timestamps null: false
    end
  end
end
