class ParticipationsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  belongs_to :user, :optional => true

  def create
    @participation.user = current_user
    create!
  end

  def moip_callback
    @participation = Participation.find_by_secret(params["id_transacao"])
    @participation.update_attribute :moip_status, params["status_pagamento"]
    @participation.update_attribute :moip_id, params["cod_moip"]
    render :status => 200, :nothing => true
  end
end
