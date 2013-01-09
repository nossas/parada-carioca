class Event < ActiveRecord::Base
  attr_accessible :activity, :date, :minimum_attendees, :maximum_attendees, :duration, :price
  
  belongs_to  :activity
  has_many    :participations
  
  scope :upcoming,  where("date >= ?", Time.now)
  scope :available, where("(SELECT count(*) FROM participations WHERE participations.event_id = events.id) < events.maximum_attendees")
  
  validates :activity, :date, :price, :minimum_attendees, :maximum_attendees, :presence => true
  validate :date_cannot_be_in_the_past

  def as_json options= {}
    {
      id:     self.id,
      title:  self.date.strftime('%H:%m'), 
      start:  self.date,
      price:  self.price,
      end:    self.date + self.duration.to_i.hours
    }
  end


  def remaining_to_maximum
    maximum_attendees - attendees.count
  end

  def remaining_to_minimum
    minimum_attendees - attendees.count
  end
  
  def minimum_reached?
    attendees.count >= minimum_attendees
  end

  def attendees
    User.joins(:participations).where("participations.user_id = users.id AND participations.event_id = ? AND participations.moip_status = '4'", self.id)
  end

  private

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if date && date < Time.now
  end
end
