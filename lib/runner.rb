require "./lib/stat_tracker"

game_path = "./data/games.csv"
team_path = "./data/teams.csv"
game_teams_path = "./data/game_teams.csv"
games_fixture_path = "./data/games_fixture.csv"
games_teams_fixture_path = "./data/games_teams_fixture.csv"


locations = {
  games: game_path,
  teams: team_path,
  game_teams: game_teams_path,
  games_fixture_path: games_fixture_path,
  games_teams_fixture_path: games_teams_fixture_path

}

stat_tracker = StatTracker.new(locations)

# require 'pry'; binding.pry