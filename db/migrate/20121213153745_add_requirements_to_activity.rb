class AddRequirementsToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :requirements, :text
  end
end
