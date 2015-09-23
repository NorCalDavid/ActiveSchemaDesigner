class AddPositionToTable < ActiveRecord::Migration
  def change
    add_column :tables, :position_y, :integer, default: 0
    add_column :tables, :position_x, :integer, default: 0
  end
end
