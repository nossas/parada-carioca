class AddMoipStatusToParticipation < ActiveRecord::Migration
  def change
    add_column :participations, :moip_status, :string
  end
end
