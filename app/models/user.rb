class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :avatar
  has_many :activities
  validates :email, :first_name, :presence => true
end
