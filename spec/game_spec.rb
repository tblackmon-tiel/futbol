require "csv"
require "./lib/team"
require "pry"
require "./lib/stat_tracker"

RSpec.describe Game do
  before :each do
    @game_path = "./data/games.csv"
    @team_path = "./data/teams.csv"
    @game_teams_path = "./data/game_teams.csv"
    @games_fixture_path = "./data/games_fixture.csv"
    @games_teams_fixture_path = "./data/games_teams_fixture.csv"
    @game_csv = CSV.open(@game_path, headers: true, header_converters: :symbol)
    @lines = @game_csv.map { |line| line }
    @game = Game.new(@lines[0])
  end

  describe "game exists" do
    it "exists" do
      expect(@game).to be_an_instance_of Game
    end

    it "has readable attributes from a provided hash" do
      expect(@game.game_id).to eq("2012030221")
      expect(@game.season).to eq("20122013")
      expect(@game.type).to eq("Postseason")
      expect(@game.date_time).to eq("5/16/13")
      expect(@game.away_team_id).to eq("3")
      expect(@game.home_team_id).to eq("6")
      expect(@game.away_goals).to eq("2")
      expect(@game.home_goals).to eq("3")
      expect(@game.venue).to eq("Toyota Stadium")
      expect(@game.venue_link).to eq("/api/v1/venues/null")
    end
  end
end
