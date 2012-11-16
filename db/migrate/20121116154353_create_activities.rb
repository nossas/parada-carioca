class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.float :price
      t.string :address

      t.timestamps
    end
  end
end
