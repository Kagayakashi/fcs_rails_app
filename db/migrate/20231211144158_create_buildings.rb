class CreateBuildings < ActiveRecord::Migration[7.1]
  def change
    create_table :buildings do |t|
      t.integer :order, null: false
      t.integer :type_id, null: false
      t.integer :level, null: false, default: 0
      t.integer :wood_requirement, null: false, default: 0
      t.integer :stone_requirement, null: false, default: 0
      t.integer :iron_requirement, null: false, default: 0
      t.integer :food_requirement, null: false, default: 0
      t.integer :time_requirement, null: false, default: 0
      t.integer :build_time, null: false, default: 0
      t.boolean :is_under_construction, null: false, default: false
      t.references :castle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
