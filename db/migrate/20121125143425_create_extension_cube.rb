class CreateExtensionCube < ActiveRecord::Migration
  def up
    execute("CREATE EXTENSION cube;")
  end

  def down
    execute("DROP EXTENSION cube;")
  end
end
