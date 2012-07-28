class UpdateMatch < ActiveRecord::Migration
  def up
    add_column :matches, :home_player_id, :integer
    add_column :matches, :away_player_id, :integer
    add_column :matches, :home_team, :string
    add_column :matches, :away_team, :string
    add_column :matches, :home_score, :integer
    add_column :matches, :away_score, :integer
  end

  def down
  end
end
