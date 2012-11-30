class AddMaximumAttendeesToEvent < ActiveRecord::Migration
  def change
    add_column :events, :maximum_attendees, :integer
  end
end
