require "csv"
require "./lib/season_stats"
require "pry"
require "./lib/stat_tracker"

RSpec.describe SeasonStats do
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
    @season_stats = SeasonStats.new(@locations)
  end

  describe "#initialize" do
    it "exists" do
      expect(@season_stats).to be_an_instance_of SeasonStats
    end
  end

  describe "#winningest_coach" do
    it "can name the coach with the best win percentage of the season" do
      expect(@season_stats.winningest_coach("20132014")).to eq "Claude Julien"
      expect(@season_stats.winningest_coach("20142015")).to eq "Alain Vigneault"
    end
  end

  describe "#worst_coach" do
    xit "can name the coach with the worst percentage for the season" do
      expect(@season_stats.worst_coach("20132014")).to eq "Peter Laviolette"
      expect(@season_stats.worst_coach("20142015")).to eq("Craig MacTavish").or(eq("Ted Nolan"))
    end
  end

  describe "#most_accurate_team" do
    xit "can name the team with the best raiot of shots to goals for the season" do
      expect(@season_stats.most_accurate_team("20132014")).to eq "Real Salt Lake"
      expect(@season_stats.most_accurate_team("20142015")).to eq "Toronto FC"
    end
  end

  describe "#least_accurate_team" do
    xit "can name the team with the worst ratio of shots to goals for the season" do
      expect(@season_stats.least_accurate_team("20132014")).to eq "New York City FC"
      expect(@season_stats.least_accurate_team("20142015")).to eq "Columbus Crew SC"
    end
  end

  describe "#most_tackles" do
    xit "can name the team with the most tackles in the season" do
      expect(@season_stats.tackles).to eq "5" => 14657
      # expect(@season_stats.most_tackles("20132014")).to eq "FC Cincinnati"
      # expect(@season_stats.most_tackles("20142015")).to eq "Seattle Sounders FC"
    end
  end

  describe "#fewest_tackles" do
    xit "can name the team with the fewest tackles in the season" do
      expect(@season_stats.fewest_tackles("20132014")).to eq "Atlanta United"
      expect(@season_stats.fewest_tackles("20142015")).to eq "Orlando City SC"
    end
  end
end
