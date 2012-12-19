class ActivitiesController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  
  before_filter only: [:index] do 
    @recent_activities = Activity.by_most_recent.limit(5)
    @popular_activities = Activity.by_popularity.limit(5)
    @popular_neighborhoods = Neighborhood.by_popularity.limit(5)
  end

  def search
    @neighborhood = Neighborhood.find_by_id(params[:by_neighborhood])
    @activities = Activity.find_all_by_neighborhood_id(params[:by_neighborhood])
    @nearby_activities = Activity.by_distance(@neighborhood.latitude, @neighborhood.longitude) - @activities
  end

  def create
    @activity.guide = current_user
    create! { activity_events_path(@activity) }
  end

  def update
    update! { edit_activity_path(@activity) }
  end
end
