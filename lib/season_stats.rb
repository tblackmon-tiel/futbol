require "./lib/stat_daddy"
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

  def tackles
    tackles_total = Hash.new(0)
    @game_teams.each do |data|
      team_id = data.team_id
      tackles = data.tackles.to_i
      tackles_total[team_id] += tackles
    end
    tackles_total
  end

  # Name of the Team with the most tackles in the season
  def most_tackles
    team_tackles = []
    tackles
    @team_goals.each do |team_id, tackles|
      puts "Team ID #{team_id}: Total Tackles - #{tackles}"
    end
  end

  def fewest_tackles(season)
    @games_teams_fixture_path.each do |data|
      # Name of the Team with the fewest tackles in the season
    end
  end
