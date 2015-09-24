class Relationship < ActiveRecord::Base
  belongs_to :table
  belongs_to :foreign_key, class_name: "Table"
  validates :table_id, presence: true
  validates :foreign_key_id, presence: true

  before_validation :determine_project!, on: [ :create, :update ]
  # before_save :determine_ports!, on: [ :create, :update ]

   private

  def determine_project!
    self.project_id = Table.find(self.table_id).project
  end

  # def determine_ports!
  #   fields = Table.find(self.table_id).fields
  #   self.primary_port = "pp#{fields[0].id}"
  #   self.foreign_port = "fp#{fields[-1].id}"
  # end

end
