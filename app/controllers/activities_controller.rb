class ActivitiesController < ApplicationController
  inherit_resources
  
  before_filter only: [:index] do 
    @recent_activities = Activity.by_most_recent.limit(5)
    @popular_guides = User.by_popularity.limit(5)
    @popular_activities = Activity.by_popularity.limit(5)
    @popular_neighborhoods = Neighborhood.by_popularity.limit(5)
  end

  before_filter only: [:create] do
    params[:activity][:user_id] = current_user.id
  end

  def search
    @neighborhood = Neighborhood.find_by_id(params[:by_neighborhood])
    @activities = Activity.find_all_by_neighborhood_id(params[:by_neighborhood])
    @nearby_activities = Activity.by_distance(@neighborhood.latitude, @neighborhood.longitude) - @activities
  end

  def create
    create! do |success, failure|
      success.html { redirect_to activity_events_path(@activity) }
      failure.html { render :new }
    end
  end
end
