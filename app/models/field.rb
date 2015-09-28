class Field < ActiveRecord::Base
  belongs_to :table

  before_save :downcase_name

  def downcase_name
    self.name = self.name.downcase
    true
  end

  def isId
    self.name == 'id'
  end
end
