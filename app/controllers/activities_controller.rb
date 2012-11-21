class ActivitiesController < InheritedResources::Base
  before_filter only: [:index] { @top_events = Event.by_popularity.limit(3) }
end
