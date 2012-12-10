class SessionsController < ApplicationController
  def create
    hash = request.env['omniauth.auth']
    self.current_user = User.find_or_create_by_uid(hash[:uid], :email => hash[:info][:email], :first_name => hash[:info][:first_name], :last_name => hash[:info][:last_name], :avatar => hash[:info][:image])
    redirect_to session.delete("restore_url") || root_path
  end
end
