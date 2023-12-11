class AddBuildingInProgressToCitadels < ActiveRecord::Migration[7.1]
  def change
    add_column :citadels, :building_in_progress, :boolean, default: false
  end
end
