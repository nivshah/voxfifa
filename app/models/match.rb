class Match < ActiveRecord::Base
  belongs_to :home_player, :foreign_key => 'home_player_id', :class_name => 'Player'
  belongs_to :away_player, :foreign_key => 'away_player_id', :class_name => 'Player'
  belongs_to :reported_by, :foreign_key => 'reported_by', :class_name => 'User'

  attr_accessible :home_player_id, :home_team, :away_player_id, :away_team, :home_score, :away_score, :reported_by

  validates :home_player_id, :presence => true
  validates :away_player_id, :presence => true
  validates :home_team, :presence => true
  validates :away_team, :presence => true
  validates :home_score, :presence => true
  validates :away_score, :presence => true
  validate :did_not_play_self

  def did_not_play_self
    if home_player == away_player
      errors[:base] << "You cannot play yourself"
    end
  end
end
