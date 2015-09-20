class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.string :data_type
      t.string :default_value
      # Validations
      t.boolean :auto_increment
      t.boolean :allow_null
      t.boolean :presence
      t.boolean :uniqueness
      t.boolean :acceptance
      t.boolean :confirmation
      t.boolean :length
      t.integer :length_min
      t.integer :length_max
      t.integer :length_is
      t.integer :length_within

      t.references :table, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
