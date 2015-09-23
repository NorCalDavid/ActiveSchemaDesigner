class Relationship < ActiveRecord::Base
  belongs_to :table
  belongs_to :foreign_key_id, class_name: "Table"
  validates :table_id, presence: true
  validates :foreign_key_id, presence: true

  after_save :get_project, on: [ :create, :update ]

  def get_project
    self.project_id = Table.find(self.table_id).project
  end

end
