class AddIncludedToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :included, :text
  end
end
