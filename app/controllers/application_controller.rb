class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    session[:restore_url] = request.url
    redirect_to "/auth/facebook"
  end

  def current_user
    @current_user = @current_user || User.find_by_id(session[:user_id])
  end

  def current_user= user
    session[:user_id] = user.id
  end
end
