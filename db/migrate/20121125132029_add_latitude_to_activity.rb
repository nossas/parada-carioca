class AddLatitudeToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :latitude, :float
  end
end
