require './lib/stat_daddy'

class LeagueStats < StatDaddy
  def count_of_teams
    @teams.count
  end

  def best_offense
    goals_by_team = Hash.new(0)
    total_games_by_team = Hash.new(0)
    average_goals_by_team = Hash.new
    @game_teams.each do |game|
      goals_by_team[game.team_id] += game.goals.to_f
    end
    @game_teams.each do |game|
      total_games_by_team[game.team_id] += 1
    end
    goals_by_team.each_key do |team|
      average_goals_by_team[team] = goals_by_team[team] / total_games_by_team[team].to_f
    end
    highest_avg_team_id = average_goals_by_team.max_by { |team, goals| goals }[0]
    @teams.find { |team| team.team_id == highest_avg_team_id }.team_name
  end

  def worst_offense
    goals_by_team = Hash.new(0)
    total_games_by_team = Hash.new(0)
    average_goals_by_team = Hash.new
    @game_teams.each do |game|
      goals_by_team[game.team_id] += game.goals.to_f
    end
    @game_teams.each do |game|
      total_games_by_team[game.team_id] += 1
    end
    goals_by_team.each_key do |team|
      average_goals_by_team[team] = goals_by_team[team] / total_games_by_team[team].to_f
    end
    lowest_avg_team_id = average_goals_by_team.min_by { |team, goals| goals }[0]
    @teams.find { |team| team.team_id == lowest_avg_team_id }.team_name
  end

  def highest_scoring_visitor

  end

  def highest_scoring_home_team

  end

  def lowest_scoring_visitor

  end

  def lowest_scoring_home_team

  end
end