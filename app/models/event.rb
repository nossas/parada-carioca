class Event < ActiveRecord::Base
  attr_accessible :activity, :date, :minimum_attendees, :maximum_attendees, :duration, :price
  
  belongs_to  :activity
  has_many    :participations
  has_many    :attendees, :through => :participations, :source => :user
  
  scope :upcoming,  where("date >= ?", Time.now)
  scope :available, where("(SELECT count(*) FROM participations WHERE participations.event_id = events.id) < events.maximum_attendees")
  
  validates :activity, :date, :price, :minimum_attendees, :maximum_attendees, :presence => true
  validate :date_cannot_be_in_the_past

  def remaining_to_maximum
    maximum_attendees - participations.count
  end

  def remaining_to_minimum
    minimum_attendees - participations.count
  end
  
  def minimum_reached?
    participations.count >= minimum_attendees
  end

  private

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if date && date < Time.now
  end
end
