class Activity < ActiveRecord::Base
  attr_accessible :address, :description, :name, :price, :user_id
  belongs_to :guide, :class_name => "User"
  validates :address, :description, :name, :price, :user_id, :presence => true
end
