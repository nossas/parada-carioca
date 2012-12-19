class ParticipationsController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  def create
    @participation.user = current_user
    create!
  end
end
