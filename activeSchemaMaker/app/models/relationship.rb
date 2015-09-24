class Relationship < ActiveRecord::Base
  belongs_to :table
  belongs_to :foreign_key, class_name: "Table"
  validates :table_id, presence: true
  validates :foreign_key_id, presence: true

  before_validation :determine_project!, on: [ :create, :update ]
  after_update :determine_ports!

   private

  def determine_project!
    self.project_id = Table.find(self.table_id).project
  end

  def determine_ports!
    self.project_id = Table.find(self.table_id).project
  end

end
