class Activity < ActiveRecord::Base
  attr_accessible :address, :description, :name, :price, :image, :user_id
  belongs_to :guide, :class_name => "User", :foreign_key => "user_id"
  validates :address, :description, :name, :price, :user_id, :presence => true
  mount_uploader :image, ImageUploader



  def to_param
    "#{id}-#{self.name.parameterize}"
  end
end
