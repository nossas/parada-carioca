class Event < ActiveRecord::Base
  attr_accessible :activity, :date
  
  belongs_to  :activity
  has_many    :participations
  has_many    :attendees, :through => :participations, :source => :user
  
  validates :activity, :date, :presence => true
end
