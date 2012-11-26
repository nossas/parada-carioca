class Neighborhood < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name

  validates :name, :uniqueness => true
  validates :latitude, :longitude, :name, :presence => true
  validates :latitude, :uniqueness => {:scope => :longitude}

  scope :by_popularity, order("(SELECT count(*) FROM participations JOIN events ON participations.event_id = events.id JOIN activities ON activities.id = events.activity_id WHERE activities.neighborhood_id = neighborhoods.id) DESC")
end
