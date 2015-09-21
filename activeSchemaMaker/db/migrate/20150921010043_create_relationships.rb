class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :table_id
      t.integer :foreign_key

      t.timestamps null: false
    end
    add_index :relationships, :table_id
    add_index :relationships, :foreign_key
    add_index :relationships, [:table_id, :foreign_key], unique: true
  end
end
