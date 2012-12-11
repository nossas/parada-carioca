class EventsController < ApplicationController
  inherit_resources
  belongs_to :activity
  before_filter only: [:index] { @event = Event.new }

  def new
    new!(:layout => nil)
  end

  def create
    create! do |success, failure|
      success.html { redirect_to activity_events_path(@activity), :flash => {:event_created_notice => "Novo evento criado para #{l @event.date}"} }
      failure.html { render :index }
    end
  end
end
