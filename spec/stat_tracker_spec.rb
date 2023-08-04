require "./lib/stat_tracker"

RSpec.describe StatTracker do
  before(:each) do
    @game_path = "./data/games.csv"
    @teams_path = "./data/teams.csv"
    @game_teams_path = "./data/game_teams.csv"
    @games_fixture_path = "./data/games_fixture.csv"
    @game_teams_fixture_path = "./data/games_teams_fixture.csv"
    @locations = {
      games: @games_fixture_path,
      teams: @teams_path,
      game_teams: @game_teams_fixture_path,
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
    it "" do
    end
  end

  describe "#lowest_total_score" do
    it "" do
    end
  end

  describe "#percentage_home_wins" do
    it "" do
    end
  end

  describe "#percentage_visitor_wins" do
    it "" do
    end
  end

  describe "#percentage_ties" do
    it "" do
    end
  end

  describe "#count_of_games_by_season" do
    it "" do
    end
  end

  describe "#average_goals_per_game" do
    it "" do
    end
  end

  describe "#average_goals_by_season" do
    it "" do
    end
  end

  describe "#count_of_teams" do
    it "" do
    end
  end

  describe "#best_offense" do
    it "" do
    end
  end

  describe "#worst_offense" do
    it "" do
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
