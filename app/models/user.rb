class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :avatar, :uid
  has_many :activities
  validates :email, :first_name, :presence => true

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
