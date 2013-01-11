class Review < ActiveRecord::Base
  attr_accessible :user_id, :activity_id, :description

  belongs_to :user
  belongs_to :activity

  validates :user_id, :activity_id, :description, :presence => true
end
