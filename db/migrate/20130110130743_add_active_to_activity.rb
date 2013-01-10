class AddActiveToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :active, :boolean, :default => true
  end
end
