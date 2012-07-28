class Match < ActiveRecord::Base
  has_one :home_player, :foreign_key => 'home_player_id', :class_name => 'Player'
  has_one :away_player, :foreign_key => 'away_player_id', :class_name => 'Player'

  validates :home_player, :presence => true
  validates :away_player, :presence => true
  validates :home_team, :presence => true
  validates :away_team, :presence => true
  validates :home_score, :presence => true
  validates :away_score, :presence => true
end
