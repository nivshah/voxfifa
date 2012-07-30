class HomeController < ApplicationController
  def index
    @standings = []
    players = Player.all
    players.each do |player|
      @standings << Standing.new(player.id)
    end

    # sort by points descending
    @standings.sort! do |a,b|
      comp = (b.points <=> a.points)
      comp.zero? ? ((b.goals_scored - b.goals_allowed) <=> (a.goals_scored - a.goals_allowed)) : comp
    end

    @matches = Match.all
  end
end
