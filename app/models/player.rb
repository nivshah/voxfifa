class Player < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true
  has_many :home_matches, :class_name => "Match", :foreign_key => "home_player_id"
  has_many :away_matches, :class_name => "Match", :foreign_key => "away_player_id"

  def all_matches
    Match.where("away_player_id = ? or home_player_id = ?", id, id)
  end
end
