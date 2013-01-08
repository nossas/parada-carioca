class AddSecretToParticipation < ActiveRecord::Migration
  def change
    add_column :participations, :secret, :string
  end
end
