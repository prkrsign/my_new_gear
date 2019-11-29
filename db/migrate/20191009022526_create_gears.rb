class CreateGears < ActiveRecord::Migration[5.2]
  def change
    create_table :gears do |t|
      t.string   :gearname,               null: false
      t.string   :image,                  null: false
      t.string   :maker,                  null: false
      t.string   :category,               null: false
      t.integer  :reviews_count,          null: false, default: 0

      t.timestamps
    end
  end
end
