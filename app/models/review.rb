class Review < ActiveRecord::Base
  attr_accessible :user_id, :activity_id, :descriptionm

  belongs_to :user
  belongs_to :activity
end
