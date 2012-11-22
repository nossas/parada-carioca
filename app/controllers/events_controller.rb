class EventsController < InheritedResources::Base
  before_filter only: [:index] do 
    @recent_events = Event.by_most_recent.limit(5)
    @most_popular_guides = User.by_popularity.limit(5)
    @top_events = Event.by_popularity.limit(3)
  end
end
