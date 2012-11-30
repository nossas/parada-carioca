class AddMinimumAttendeesToEvent < ActiveRecord::Migration
  def change
    add_column :events, :minimum_attendees, :integer
  end
end
