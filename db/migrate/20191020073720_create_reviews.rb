class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text      :details,                  null: false
      t.integer   :cost_performance,         null: false
      t.integer   :sound,                    null: false
      t.integer   :durability,               null: false
      t.integer   :design,                   null: false
      t.integer   :satisfaction_level,       null: false
      t.bigint    :gear_id,                  null: false, foreign_key: true

      t.timestamps
    end
  end
end
