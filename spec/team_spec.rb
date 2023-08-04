require "csv"
require "./lib/team"
require "pry"
require "./lib/stat_tracker"

RSpec.describe Team do
  before :each do
    @game_path = "./data/games.csv"
    @team_path = "./data/teams.csv"
    @game_teams_path = "./data/game_teams.csv"
    @games_fixture_path = "./data/games_fixture.csv"
    @games_teams_fixture_path = "./data/games_teams_fixture.csv"
    @locations = 
    {
      games: @games_fixture_path,
      teams: @team_path,
      game_teams: @game_teams_path,
      games_fixture_path: @games_fixture_path,
      games_teams_fixture_path: @games_teams_fixture_path
    
    }
    @team = Team.new(@locations)
  end

  describe "team exists" do
    it "exists" do
      expect(@team).to be_an_instance_of Team
    end
  end
