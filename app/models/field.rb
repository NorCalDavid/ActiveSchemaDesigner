class Field < ActiveRecord::Base
  belongs_to :table

  before_save :downcase_name
  # below needs changes elsewhere to function correctly
  # before_destroy {|record| Relationship.destroy_all "foreign_key_id = #{record.id}"}

  def downcase_name
    self.name = self.name.downcase
    true
  end

  def isId
    self.name == 'id'
  end


end
