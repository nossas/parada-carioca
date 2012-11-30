class ActivitiesController < ApplicationController
  inherit_resources
  
  before_filter only: [:index] do 
    @recent_activities = Activity.by_most_recent.limit(5)
    @popular_guides = User.by_popularity.limit(5)
    @popular_activities = Activity.by_popularity.limit(5)
    @popular_neighborhoods = Neighborhood.by_popularity.limit(5)
  end

  def search
    @neighborhood = Neighborhood.find_by_id(params[:by_neighborhood])
    @activities = Activity.by_distance(@neighborhood.latitude, @neighborhood.longitude)
  end
end
