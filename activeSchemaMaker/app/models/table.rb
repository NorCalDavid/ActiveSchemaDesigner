class Table < ActiveRecord::Base
  belongs_to :project
  has_many :fields, class_name: "Field"
  accepts_nested_attributes_for :fields

  has_many :relationships
  has_many :foreign_keys, through: :relationships

  before_validation :determine_position!, on: :create
  # before_validation :add_id!, on: [:create]

  private

  # def add_id!
  #   primary_table = Table.find(self.table_id)

  #   if !primary_table.includes("#{primary_table.name}_id")
  #     primary_table.fields.create({name: "#{primary_table.name}_id", data_type: 'integer'})
  #   end

  # end

  def determine_position!
    size = self.project.tables.count * 10
    self.position_x = "#{size}px"
    self.position_y = "#{size}px"
  end
end
