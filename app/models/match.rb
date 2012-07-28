class Match < ActiveRecord::Base
  belongs_to :home_player, :foreign_key => 'home_player_id', :class_name => 'Player'
  belongs_to :away_player, :foreign_key => 'away_player_id', :class_name => 'Player'

  attr_accessible :home_player_id, :home_team, :away_player_id, :away_team, :home_score, :away_score

  validates :home_player_id, :presence => true
  validates :away_player_id, :presence => true
  validates :home_team, :presence => true
  validates :away_team, :presence => true
  validates :home_score, :presence => true
  validates :away_score, :presence => true
end
