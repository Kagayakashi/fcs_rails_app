class CreateCitadels < ActiveRecord::Migration[7.1]
  def change
    create_table :citadels do |t|
      t.string :name
      t.integer :level, null: false, default: 0
      t.integer :tree_requirement, null: false, default: 0
      t.integer :stone_requirement, null: false, default: 0
      t.integer :iron_requirement, null: false, default: 0
      t.integer :food_requirement, null: false, default: 0
      t.integer :build_time, null: false, default: 0
      t.references :castle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
