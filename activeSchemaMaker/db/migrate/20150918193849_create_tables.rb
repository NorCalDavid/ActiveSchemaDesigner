class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.string :comments
      t.references :project_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
