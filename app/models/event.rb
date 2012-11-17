class Event < ActiveRecord::Base
  attr_accessible :activity, :date
  
  belongs_to  :activity
  has_many    :participations
  has_many    :attendees, :through => :participations, :source => :user
  
  validates :activity, :date, :presence => true
  
  scope :by_popularity, order("(SELECT count(*) FROM participations WHERE participations.event_id = events.id) DESC")
end
