class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.text :comments
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end