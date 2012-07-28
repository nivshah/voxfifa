class Match < ActiveRecord::Base
  has_one :home_player, :foreign_key => 'home_player_id', :class_name => 'Player'
  has_one :away_player, :foreign_key => 'away_player_id', :class_name => 'Player'

  attr_accessible :home_team, :away_team, :home_score, :away_score

  validates :home_player, :presence => true
  validates :away_player, :presence => true
  validates :home_team, :presence => true
  validates :away_team, :presence => true
  validates :home_score, :presence => true
  validates :away_score, :presence => true
end
