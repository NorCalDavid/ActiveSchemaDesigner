class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :relationships, :foreign_key, :foreign_key_id
  end
end
