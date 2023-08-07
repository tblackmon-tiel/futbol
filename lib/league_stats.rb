require_relative "stat_daddy"

class LeagueStats < StatDaddy
  def count_of_teams
    @teams.count
  end

  def best_offense
    highest_avg_team_id = average_goals_by_team(@game_teams).max_by { |team, goals| goals }[0]
    @teams.find { |team| team.team_id == highest_avg_team_id }.team_name
  end

  def worst_offense
    lowest_avg_team_id = average_goals_by_team(@game_teams).min_by { |team, goals| goals }[0]
    @teams.find { |team| team.team_id == lowest_avg_team_id }.team_name
  end

  def highest_scoring_visitor
    all_away_games = @game_teams.find_all { |game| game.hoa == "away" }
    highest_avg_team_id = average_goals_by_team(all_away_games).max_by { |team, goals| goals }[0]
    @teams.find { |team| team.team_id == highest_avg_team_id }.team_name
  end

  def highest_scoring_home_team
    all_home_games = @game_teams.find_all { |game| game.hoa == "home" }
    highest_avg_team_id = average_goals_by_team(all_home_games).max_by { |team, goals| goals }[0]
    @teams.find { |team| team.team_id == highest_avg_team_id }.team_name
  end

  def lowest_scoring_visitor
    all_away_games = @game_teams.find_all { |game| game.hoa == "away" }
    lowest_avg_team_id = average_goals_by_team(all_away_games).min_by { |team, goals| goals }[0]
    @teams.find { |team| team.team_id == lowest_avg_team_id }.team_name
  end

  def lowest_scoring_home_team
    all_home_games = @game_teams.find_all { |game| game.hoa == "home" }
    lowest_avg_team_id = average_goals_by_team(all_home_games).min_by { |team, goals| goals }[0]
    @teams.find { |team| team.team_id == lowest_avg_team_id }.team_name
  end

  def average_goals_by_team(game_teams)
    goals_by_team = Hash.new(0)
    total_games_by_team = Hash.new(0)
    average_goals_by_team = Hash.new
    game_teams.each do |game|
      goals_by_team[game.team_id] += game.goals.to_f
      total_games_by_team[game.team_id] += 1
    end
    goals_by_team.each_key do |team|
      average_goals_by_team[team] = goals_by_team[team] / total_games_by_team[team].to_f
    end
    average_goals_by_team
  end
end