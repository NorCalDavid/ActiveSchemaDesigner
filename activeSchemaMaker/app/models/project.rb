class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tables
  has_many :relationships, through: :tables
end
