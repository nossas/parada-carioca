class AddAcceptedToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :accepted, :boolean
  end
end
