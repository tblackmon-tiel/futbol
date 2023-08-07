require "./lib/stat_tracker"

RSpec.describe StatTracker do
  before(:each) do
    @game_path = "./data/games.csv"
    @teams_path = "./data/teams.csv"
    @game_teams_path = "./data/game_teams.csv"
    @games_fixture_path = "./data/games_fixture.csv"
    @game_teams_fixture_path = "./data/games_teams_fixture.csv"
    @locations = {
      games: @game_path,
      teams: @teams_path,
      game_teams: @game_teams_path,
    }
    @tracker = StatTracker.new(@locations)
  end
  describe "#initialize" do
    it "exists" do
      expect(@tracker).to be_a StatTracker
    end

    it "has a game_stats, season_stats, and league_stats attribute that is readable" do
      tracker = StatTracker.new(@locations)

      expect(@tracker.game_stats).to be_a GameStats
      expect(@tracker.season_stats).to be_a SeasonStats
      expect(@tracker.league_stats).to be_a LeagueStats
    end
  end

  describe "##from_csv" do
    it "returns a new instance of a StatTracker object given a hash of filepaths" do
      tracker = StatTracker.from_csv(@locations)

      expect(tracker.game_stats).to be_a GameStats
      expect(tracker.season_stats).to be_a SeasonStats
      expect(tracker.league_stats).to be_a LeagueStats
    end
  end

  describe "#highest_total_score" do
    it "finds the highest sum of the winning and losing teams scores" do
      expect(@tracker.highest_total_score).to eq(11)
    end
  end

  describe "#lowest_total_score" do
    it "finds the lowest sum of the winning and losing teams scores" do
      expect(@game_stats.lowest_total_score).to eq(0)
    end
  end

  describe "#percentage_home_wins" do
    it "finds the percentage of games that a home team has won (rounded to the nearest 100th)" do
      expect(@game_stats.percentage_home_wins).to eq(0.44)
    end
  end

  describe "#percentage_visitor_wins" do
    it "finds the percentage of games that a visitor has won (rounded to the nearest 100th)" do
      expect(@game_stats.percentage_visitor_wins).to eq(0.36)
    end
  end

  describe "#percentage_ties" do
    it "finds the percentage of games that has resulted in a tie (rounded to the nearest 100th)" do
      expect(@game_stats.percentage_ties).to eq(0.20)
    end
  end

  describe "#count_of_games_by_season" do
    it 'creates a hash with season names (e.g. 20122013) as keys and counts of games as values' do
      expected_hash = 
      {
        "20132014"=>806,
        "20122013"=>1317,
        "20142015"=>1319,
        "20162017"=>1321,
        "20152016"=>1323,
        "20172018"=>1355
      }
      expect(@game_stats.count_of_games_by_season).to eq(expected_hash)
    end
  end

  describe "#average_goals_per_game" do
    it "finds the average number of goals scored in a game across all seasons including both home and away goals (rounded to the nearest 100th)" do
      expect(@game_stats.average_goals_per_game).to eq(4.22)
    end
  end


  describe "#average_goals_by_season" do
    it 'finds the average number of goals scored in a game organized in a hash with season names (e.g. 20122013) as keys and a float representing the average number of goals in a game for that season as values (rounded to the nearest 100th)' do
      # binding.pry
      expected_hash = 
      {
        "20132014"=>4.12,
        "20122013"=>4.23,
        "20142015"=>4.14,
        "20162017"=>4.16,
        "20152016"=>4.19,
        "20172018"=>4.44
      }
      expect(@game_stats.average_goals_by_season).to eq(expected_hash)
    end
  end

  describe "#count_of_teams" do
    it "returns total number of teams in the data" do
      expect(@ls.count_of_teams).to be(32)
    end
  end

  describe "#best_offense" do
    it "returns name of team with highest avg goals scored per game across all seasons" do
      expect(@ls.best_offense).to eq("Reign FC")
    end
  end

  describe "#worst_offense" do
    it "returns name of team with lowest avg goals per game across all seasons" do
      expect(@ls.worst_offense).to eq("Utah Royals FC")
    end
  end

  describe "#highest_scoring_visitor" do
    it "" do
    end
  end

  describe "#highest_scoring_home_team" do
    it "" do
    end
  end

  describe "#lowest_scoring_visitor" do
    it "" do
    end
  end

  describe "#lowest_scoring_home_team" do
    it "" do
    end
  end

  describe "#winningest_coach" do
    it "" do
    end
  end

  describe "#worst_coach" do
    it "" do
    end
  end

  describe "#most_accurate_team" do
    it "" do
    end
  end

  describe "#least_accurate_team" do
    it "" do
    end
  end

  describe "#most_tackles" do
    it "" do
    end
  end

  describe "#fewest_tackles" do
    it "" do
    end
  end
end
