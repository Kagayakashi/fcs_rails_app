class CreateCastles < ActiveRecord::Migration[7.1]
  def change
    create_table :castles do |t|
      t.string :name, null: false
      t.integer :x, null: false
      t.integer :y, null: false
      t.boolean :is_main, null: false, default: false
      t.references :user, null: false, foreign_key: true
      t.index [:x, :y], unique: true

      t.timestamps
    end
  end
end
