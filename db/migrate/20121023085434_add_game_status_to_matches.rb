class AddGameStatusToMatches < ActiveRecord::Migration
  def up
    add_column :matches, :game_status, :string
  end

  def down
    remove_column :matches, :game_status
  end
end
