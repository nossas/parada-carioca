class AddDescriptionToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :description, :text
  end
end
