namespace :schedule do
  desc "Generate full-season schedule"
  task :generate => :environment do
    # possible game times:
    # Monday 6pm
    # Thursday 4pm 5pm 6pm
    # Friday 4pm 6pm

    Player.all.combination(2) { |match|
      if match[0].home_matches < match[1].home_matches
        home_player = match[0]
        away_player = match[1]
      elsif match[0].home_matches > match[1].home_matches
        home_player = match[1]
        away_player = match[0]
      else
        # coin flip
        coin_flip = match.sample(2)
        home_player = coin_flip[0]
        away_player = coin_flip[1]
      end

      match = Match.new(
        :home_player => home_player,
        :away_player => away_player
      )
      match.save!
    }
  end
end