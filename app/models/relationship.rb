class Relationship < ActiveRecord::Base
  belongs_to :table
  belongs_to :foreign_key, class_name: "Table"
  validates :table_id, presence: true
  validates :foreign_key_id, presence: true

end
