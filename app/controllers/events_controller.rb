class EventsController < ApplicationController
  inherit_resources
  belongs_to :activity
end
