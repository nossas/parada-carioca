class AddMoipIdToParticipation < ActiveRecord::Migration
  def change
    add_column :participations, :moip_id, :string
  end
end
