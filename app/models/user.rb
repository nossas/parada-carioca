class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :avatar, :uid
  has_many :activities
  validates :email, :first_name, :presence => true
  scope :by_popularity, order("(SELECT count(*) FROM participations JOIN events ON participations.event_id = events.id JOIN activities ON activities.id = events.activity_id WHERE activities.user_id = users.id) DESC")

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
