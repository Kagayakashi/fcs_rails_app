class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :race_id, :integer, null: false
  end
end
