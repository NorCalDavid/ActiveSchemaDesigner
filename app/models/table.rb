class Table < ActiveRecord::Base
  belongs_to :project
  has_many :fields, class_name: "Field"
  accepts_nested_attributes_for :fields, allow_destroy: true

  has_many :relationships
  has_many :foreign_keys, through: :relationships

  before_validation :determine_position!, on: :create

  before_save :downcase_name

  def downcase_name
    self.name = self.name.downcase
    true
  end

  def ordered_fields
    fields.sort_by do |field|
      if field.isId
        -1
      else
        field.id
      end
    end
  end

  private

  def determine_position!
    size = self.project.tables.count * 10
    self.position_x = "#{size}px"
    self.position_y = "#{size}px"
  end
end
