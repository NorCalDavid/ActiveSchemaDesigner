class Table < ActiveRecord::Base
  belongs_to :project
  has_many :fields
end
