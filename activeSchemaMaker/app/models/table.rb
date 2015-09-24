class Table < ActiveRecord::Base
  belongs_to :project
  has_many :fields, class_name: "Field"
  accepts_nested_attributes_for :fields

  has_many :relationships
  has_many :foreign_keys, through: :relationships

  before_validation :determine_position!, on: :create

  private

  def determine_position!
    size = self.project.tables.count * 10
    self.position_x = "#{size}px"
    self.position_y = "#{size}px"
  end
end
