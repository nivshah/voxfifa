class HomeController < ApplicationController
  def index
    @standings = []
    players = Player.all
    players.each do |player|
      @standings << Standing.new(player.id)
    end

    # sort by points descending
    @standings.sort! { |a,b| b.points <=> a.points }

    @matches = Match.all
  end
end