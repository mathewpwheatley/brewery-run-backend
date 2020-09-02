class AddElevationDistanceToCircuits < ActiveRecord::Migration[6.0]
  def change
    add_column :circuits, :elevation, :integer
    add_column :circuits, :distance, :decimal, precision: 5, scale: 2
  end
end
