class EventsController < ApplicationController 
  inherit_resources
  optional_belongs_to :activity

  before_filter only: [:index] do 
    @recent_events = Event.by_most_recent.limit(5)
    @popular_guides = User.by_popularity.limit(5)
    @popular_events = Event.by_popularity.limit(5)
    @popular_neighborhoods = Neighborhood.by_popularity.limit(5)
  end

  def search
    @neighborhood = Neighborhood.find_by_id(params[:by_neighborhood])
    @events = Event.by_distance(@neighborhood.latitude, @neighborhood.longitude)
  end
end
