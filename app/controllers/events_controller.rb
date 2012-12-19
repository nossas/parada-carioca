class EventsController < ApplicationController
  inherit_resources
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
    create! { edit_activity_path(@activity, anchor: :events) }
  end

  def destroy
    destroy! { edit_activity_path(@activity, anchor: :events) }
  end

  def update
    update! { edit_activity_path(@activity, anchor: :events) }
  end
end
