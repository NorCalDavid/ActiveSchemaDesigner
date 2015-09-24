class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :table_id
      t.integer :foreign_key_id
      t.string :relationship_type
      t.string :primary_port # Refers to the Primary Field ID
      t.string :foreign_port # Refers to the Foreign Field ID
      t.integer :project_id   # Refers to the Project ID for this Relationship

      t.timestamps null: false
    end
    add_index :relationships, :table_id
    add_index :relationships, :foreign_key_id
    add_index :relationships, [:table_id, :foreign_key_id], unique: true
  end
end
