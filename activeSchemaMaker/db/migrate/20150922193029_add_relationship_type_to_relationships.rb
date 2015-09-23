class AddRelationshipTypeToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :relationship_type, :string
  end
end
