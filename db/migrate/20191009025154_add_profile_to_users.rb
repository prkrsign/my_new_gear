class AddProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :favorite, :string
    add_column :users, :profile,  :text
    add_column :users, :avatar,   :string
    add_column :users, :genre_id, :bigint, foreign_key: true
  end
end
