require "csv"
require "./lib/game_stats"
require "pry"
require "./lib/stat_tracker"

RSpec.describe GameStats do
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
    @game_stats = GameStats.new(@locations)
  end

  describe "game_stats exists" do
    it "exists" do
      expect(@game_stats).to be_an_instance_of GameStats
    end
  end

  describe "#highest_total_score" do
    it "finds the highest sum of the winning and losing teams scores" do
      # binding.pry
      expect(@game_stats.highest_total_score).to eq(7)
    end
  end

  describe "#lowest_total_score" do
    it "finds the lowest sum of the winning and losing teams scores" do
      # binding.pry
      expect(@game_stats.lowest_total_score).to eq(1)
    end
  end

  describe "#percentage_home_wins" do
    it "finds the percentage of games that a home team has won (rounded to the nearest 100th)" do
      # binding.pry
      expect(@game_stats.percentage_home_wins).to eq(60.0)
    end
  end

  describe "#percentage_visitor_wins" do
    it "finds the percentage of games that a visitor has won (rounded to the nearest 100th)" do
      # binding.pry
      expect(@game_stats.percentage_visitor_wins).to eq(31.43)
    end
  end
  
  describe "#percentage_ties" do
    it "finds the percentage of games that has resulted in a tie (rounded to the nearest 100th)" do
      # binding.pry
      expect(@game_stats.percentage_ties).to eq(8.57)
    end
  end

  describe "#count_of_games_by_season" do
    it 'creates a hash with season names (e.g. 20122013) as keys and counts of games as values' do
      # binding.pry
      expected_hash = 
      {
        "20132014"=>12,
        "20122013"=>8,
        "20142015"=>7,
        "20162017"=>4,
        "20152016"=>3,
        "20172018"=>1
      }
      expect(@game_stats.count_of_games_by_season).to eq(expected_hash)
    end
  end
  
  describe "#average_goals_per_game" do
    it "finds the average number of goals scored in a game across all seasons including both home and away goals (rounded to the nearest 100th)" do
      # binding.pry
      expect(@game_stats.average_goals_per_game).to eq(4.11)
    end
  end

  describe "#average_goals_by_season" do
    it 'finds the average number of goals scored in a game organized in a hash with season names (e.g. 20122013) as keys and a float representing the average number of goals in a game for that season as values (rounded to the nearest 100th)' do
      # binding.pry
      expected_hash = 
      {
        "20132014"=>4.25,
        "20122013"=>4.125,
        "20142015"=>3.857142857142857,
        "20162017"=>4.5,
        "20152016"=>3.6666666666666665,
        "20172018"=>4.0
      }
      expect(@game_stats.average_goals_by_season).to eq(expected_hash)
    end
  end
end