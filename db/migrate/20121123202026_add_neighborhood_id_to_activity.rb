class AddNeighborhoodIdToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :neighborhood_id, :integer
  end
end
