class AddLongitudeToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :longitude, :float
  end
end
