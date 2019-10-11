class CreateGears < ActiveRecord::Migration[5.2]
  def change
    create_table :gears do |t|
      t.string   :gearname,               null: false
      t.text     :review,                 null: false
      t.integer  :cost_performance,       null: false
      t.integer  :sound,                  null: false
      t.integer  :design,                 null: false
      t.integer  :durability,             null: false
      t.integer  :dissatisfaction,        null: false
      t.string   :image,                  null: false
      t.bigint   :category_id,            null: false, foreign_key: true
      t.bigint   :user_id,                null: false, foreign_key: true
      t.bigint   :maker_id,               null: false, foreign_key: true

      t.timestamps
    end
  end
end
