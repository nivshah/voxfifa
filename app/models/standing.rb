class Standing

  def initialize(player)
    @player = Player.find(player)
  end

  def player
    @player
  end

  def wins
    win_count = 0
    player.all_matches.each do |match|
      if (match.home_player_id == player.id && match.home_score > match.away_score) ||
         (match.away_player_id == player.id && match.away_score > match.home_score)
        win_count = win_count + 1
      end
    end

    win_count
  end

  def losses
    loss_count = 0
    player.all_matches.each do |match|
      if (match.home_player_id == player.id && match.home_score < match.away_score) ||
         (match.away_player_id == player.id && match.away_score < match.home_score)
        loss_count = loss_count + 1
      end
    end

    loss_count
  end

  def ties
    tie_count = 0
    player.all_matches.each do |match|
      if match.home_score == match.away_score
        tie_count = tie_count + 1
      end
    end

    tie_count
  end

  def points
    (wins * 3) + (ties * 1)
  end

  def goals_scored
    goal_count = 0
    player.all_matches.each do |match|
      if match.home_player_id == player.id
        goal_count += match.home_score
      elsif match.away_player_id == player.id
        goal_count += match.away_score
      end
    end

    goal_count
  end

  def goals_allowed
    goal_count = 0
    player.all_matches.each do |match|
      if match.home_player_id == player.id
        goal_count += match.away_score
      elsif match.away_player_id == player.id
        goal_count += match.home_score
      end
    end

    goal_count
  end
end