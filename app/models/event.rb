class Event < ActiveRecord::Base
  attr_accessible :activity, :date
  
  belongs_to  :activity
  has_many    :participations
  has_many    :attendees, :through => :participations, :source => :user
  
  validates :activity, :date, :presence => true
  
  scope :by_popularity,   order("(SELECT count(*) FROM participations WHERE participations.event_id = events.id) DESC")
  scope :by_most_recent,  order("created_at DESC")
  
  def self.by_distance latitude, longitude
    order("(SELECT earth_distance(ll_to_earth(activities.latitude::numeric, activities.longitude::numeric), ll_to_earth(#{latitude}, #{longitude})) FROM activities WHERE activities.id = events.activity_id)")
  end
end
