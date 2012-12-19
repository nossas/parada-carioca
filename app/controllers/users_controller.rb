class UsersController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  def update
    update! do |success, failure|
      if request.xhr?
        success.html { render :json => @user }
        failure.html { render :json => @user }
      end
    end
  end
end
