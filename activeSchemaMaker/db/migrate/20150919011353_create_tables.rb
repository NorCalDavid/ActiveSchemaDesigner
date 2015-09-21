class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.text :comments
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
