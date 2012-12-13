class AddCancellationReasonToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :cancellation_reason, :text
  end
end
