class Activity < ActiveRecord::Base
  attr_accessible :address, :description, :name, :price, :image, :user_id, :latitude, 
    :longitude, :neighborhood, :neighborhood_id, :included, :requirements, :cancellation_reason, :active

  has_many :events
  has_many :reviews
  belongs_to :guide, :class_name => "User", :foreign_key => "user_id"
  belongs_to :neighborhood

  scope :by_most_recent,  order("created_at DESC")
  scope :by_popularity,   order("(SELECT count(*) FROM participations JOIN events ON events.activity_id = activities.id WHERE participations.event_id = events.id) DESC")
  scope :active,          where(:active => true)

  validates :address, :description, :name, :price, :user_id, :latitude, :longitude, :neighborhood_id, :image, :presence => true
  
  mount_uploader :image, ImageUploader

  def self.by_distance latitude, longitude, distance = 3000
    where("(earth_distance(ll_to_earth(activities.latitude::numeric, activities.longitude::numeric), ll_to_earth(#{latitude}, #{longitude}))) <= ?", distance).order("(SELECT earth_distance(ll_to_earth(activities.latitude::numeric, activities.longitude::numeric), ll_to_earth(#{latitude}, #{longitude})))")
  end


  def minimum_attendees
    events.any? ? events.minimum(:minimum_attendees) : nil
  end

  def maximum_attendees
    events.any? ? events.maximum(:maximum_attendees) : nil
  end

  def duration
    events.any? ? events.average(:duration).to_i : nil
  end

  def awaiting_moderation?
    accepted.nil?
  end
end
