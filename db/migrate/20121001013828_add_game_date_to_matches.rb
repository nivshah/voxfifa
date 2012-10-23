class AddGameDateToMatches < ActiveRecord::Migration
  def up
    add_column :matches, :game_date, :datetime
  end

  def down
    remove_column :matches, :game_date
  end
end
