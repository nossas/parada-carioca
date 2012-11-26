class CreateExtensionEarthdistance < ActiveRecord::Migration
  def up
    execute("CREATE EXTENSION earthdistance;")
  end

  def down
    execute("DROP EXTENSION earthdistance;")
  end
end
