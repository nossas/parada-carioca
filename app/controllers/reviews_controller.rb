# coding: utf-8
class ReviewsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  belongs_to :activity

  def create
    @review.user = current_user
    create! do |success, failure|
      success.html { redirect_to activity_path(@activity, :anchor => "new_review_btn"), :flash => {:new_review => "Irado! Agradecemos a sua avaliação"} }
    end
  end
end
