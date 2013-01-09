class EventsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  belongs_to :activity
  respond_to :json, only: [:index]

  before_filter only: [:index] { @event = Event.new }

  def new
    new! { return render partial: 'form', layout: nil }
  end

  def edit
    edit! { return render partial: 'form', layout: nil }
  end

  def create
    create! do |success, failure|
      success.html { redirect_to edit_activity_path(@activity, anchor: :events) }
      failure.html { redirect_to edit_activity_path(@activity, anchor: :events) }
    end
  end

  def destroy
    destroy! do |success, failure|
      success.html { redirect_to edit_activity_path(@activity, :anchor => "events"), :flash => {:notice => "Sua data foi cancelada"} }
    end
  end

  def update
    update! { edit_activity_path(@activity, anchor: :events) }
  end
end
