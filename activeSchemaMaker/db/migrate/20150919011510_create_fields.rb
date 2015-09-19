class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.string :data_type
      t.string :default_value
      t.boolean :auto_increment
      t.boolean :allow_null
      t.references :table, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
