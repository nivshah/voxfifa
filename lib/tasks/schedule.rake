namespace :schedule do
  desc "Generate full-season schedule"
  task :generate => :environment do
    player_count = Player.count

    Player.all.shuffle.combination(2) { |match|
      if match[0].home_matches.count < (player_count / 2).floor
        home_player = match[0]
        away_player = match[1]
      elsif match[0].home_matches.count == (player_count / 2).floor
        home_player = match[1]
        away_player = match[0]
      else
        # coin flip
        coin_flip = match.sample(2)
        home_player = coin_flip[0]
        away_player = coin_flip[1]
      end

      match = Match.new(
        :home_player_id => home_player.id,
        :away_player_id => away_player.id,
        :game_status => 'pre'
      )
      match.save!
    }
  end
end