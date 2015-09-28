class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.text :comments
      t.integer :project_id
      t.integer :position_y, default: 0
      t.integer :position_x, default: 0

      t.timestamps null: false
    end
  end
end
