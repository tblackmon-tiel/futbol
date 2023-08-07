require_relative "stat_daddy"
require "csv"
require "pry"

class SeasonStats < StatDaddy

  def winningest_coach(season)
    coach_wins = Hash.new(0)
    coach_games = Hash.new(0)

    @game_teams.each do |game_team|
      game = @games.find { |game| game.game_id == game_team.game_id }
      next if game.nil? || game.season != season

      coach = game_team.head_coach
      coach_wins[coach] += 1 if game_team.result == "WIN"
      coach_games[coach] += 1
    end

    coach_win_percentages = {}
    coach_wins.each do |coach, wins|
      total_games = coach_games[coach]
      win_percentage = (wins.to_f / total_games) * 100
      coach_win_percentages[coach] = win_percentage.round(2)
    end

    winningest_coach = coach_win_percentages.max_by { |_, percentage| percentage }
    winningest_coach.first
  end

  def worst_coach(season)
    coach_wins = Hash.new(0)
    coach_games = Hash.new(0)

    @game_teams.each do |game_team|
      game = @games.find { |game| game.game_id == game_team.game_id }
      next if game.nil? || game.season != season

      coach = game_team.head_coach
      coach_wins[coach] = 0 if coach_wins[coach] == 0
      coach_wins[coach] += 1 if game_team.result == "WIN"
      coach_games[coach] += 1
    end

    coach_win_percentages = {}
    coach_wins.each do |coach, wins|
      total_games = coach_games[coach]
      win_percentage = (wins.to_f / total_games) * 100
      coach_win_percentages[coach] = win_percentage.round(2)
    end

    worst_coach = coach_win_percentages.min_by { |_, percentage| percentage }
    worst_coach.first
  end

  def most_accurate_team(season)
    team_shots = Hash.new(0)
    team_goals = Hash.new(0)
    team_accuracy = Hash.new

    @game_teams.each do |game_team|
      game = @games.find { |game| game.game_id == game_team.game_id }
      next if game.nil? || game.season != season

      team = game_team.team_id
      shots = game_team.shots.to_f
      goals = game_team.goals.to_f
      team_shots[team] += shots
      team_goals[team] += goals
    end

    team_shots.each do |team, shots|
      team_accuracy[team] = team_goals[team] / shots
    end

    most_accurate_team = team_accuracy.max_by { |_, accuracy| accuracy }.first
    @teams.find { |team| team.team_id == most_accurate_team }.team_name
  end

  def least_accurate_team(season)
    team_shots = Hash.new(0)
    team_goals = Hash.new(0)
    team_accuracy = Hash.new

    @game_teams.each do |game_team|
      game = @games.find { |game| game.game_id == game_team.game_id }
      next if game.nil? || game.season != season

      team = game_team.team_id
      shots = game_team.shots.to_f
      goals = game_team.goals.to_f
      team_shots[team] += shots
      team_goals[team] += goals
    end

    team_shots.each do |team, shots|
      team_accuracy[team] = team_goals[team] / shots
    end

    least_accurate_team = team_accuracy.min_by { |_, accuracy| accuracy }.first
    @teams.find { |team| team.team_id == least_accurate_team }.team_name
  end

  def most_tackles(season)
    team_tackles = Hash.new(0)
    @game_teams.each do |game_team|
      game = @games.find { |game| game.game_id == game_team.game_id }
      next if game.nil? || game.season != season

      team = game_team.team_id
      tackles = game_team.tackles.to_i
      team_tackles[team] += tackles
    end

    team_most_tackles = team_tackles.max_by { |_, tackles| tackles }.first
    @teams.find { |team| team.team_id == team_most_tackles }.team_name
  end

  def fewest_tackles(season)
    team_tackles = Hash.new(0)
    @game_teams.each do |game_team|
      game = @games.find { |game| game.game_id == game_team.game_id }
      next if game.nil? || game.season != season

      team = game_team.team_id
      tackles = game_team.tackles.to_i
      team_tackles[team] += tackles
    end

    team_fewest_tackles = team_tackles.min_by { |_, tackles| tackles }.first
    @teams.find { |team| team.team_id == team_fewest_tackles }.team_name
  end
end