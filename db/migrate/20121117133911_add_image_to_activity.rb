class AddImageToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :image, :string
  end
end
