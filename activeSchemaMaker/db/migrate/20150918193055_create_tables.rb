class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.string :comments
      t.project_id :references

      t.timestamps null: false
    end
  end
end
