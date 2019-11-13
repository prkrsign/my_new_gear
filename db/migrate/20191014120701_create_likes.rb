class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.bigint :user_id, foreign_key: true
      t.bigint :review_id, foreign_key: true

      t.timestamps
    end
  end
end
