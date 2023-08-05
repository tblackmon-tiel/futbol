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
    @team_csv = CSV.open(@team_path, headers: true, header_converters: :symbol)
    @lines = @team_csv.map { |line| line }
    @team = Team.new(@lines[0])
  end

  describe "team exists" do
    it "exists" do
      expect(@team).to be_an_instance_of Team
    end

    it "has readable attributes from a provided hash" do
      expect(@team.team_id).to eq("1")
      expect(@team.franchise_id).to eq("23")
      expect(@team.team_name).to eq("Atlanta United")
      expect(@team.abbreviation).to eq("ATL")
      expect(@team.stadium).to eq("Mercedes-Benz Stadium")
      expect(@team.link).to eq("/api/v1/teams/1")
    end
  end
end
