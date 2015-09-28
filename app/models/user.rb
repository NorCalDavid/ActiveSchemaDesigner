class User < ActiveRecord::Base

  has_secure_password
  has_many :projects

  validates :email, {
                      :uniqueness => {:case_sensitive => false},
                      :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
                    }

  validates :password, :presence => true, length: {minimum: 6}, confirmation: true

end
