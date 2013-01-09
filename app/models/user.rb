class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :avatar, :uid, :phone

  has_many :activities
  has_many :reviews, :through => :activities
  has_many :participations

  validates :email, :first_name, :presence => true

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
