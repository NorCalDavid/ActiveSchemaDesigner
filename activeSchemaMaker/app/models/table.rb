class Table < ActiveRecord::Base
  belongs_to :project
  has_many :fields, class_name: "Field"
  accepts_nested_attributes_for :fields
end
