class Event < ActiveRecord::Base
  attr_accessible :activity, :date, :minimum_attendees, :maximum_attendees, :duration, :price
  
  belongs_to  :activity
  has_many    :participations
  has_many    :attendees, :through => :participations, :source => :user
  
  validates :activity, :date, :price, :minimum_attendees, :maximum_attendees, :presence => true
end
