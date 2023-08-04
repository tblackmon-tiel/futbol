require 'spec_helper'

RSpec.describe LeagueStats do
  before(:each) do
    @game_path = './data/games.csv'
    @teams_path = './data/teams.csv'
    @game_teams_path = './data/game_teams.csv'
    @games_fixture_path = './data/games_fixture.csv'
    @game_teams_fixture_path = './data/games_teams_fixture.csv'
    @locations = {
      games: @game_path,
      teams: @teams_path,
      game_teams: @game_teams_path,
    }
    @ls = LeagueStats.new(@locations)
  end

  describe "#initialize" do
    it "exists" do
      expect(@ls).to be_a LeagueStats
    end

    it "has readable attributes for games data, teams data, and games_teams data" do
      expect(@ls.games).to be_an Array
      expect(@ls.teams).to be_an Array
      expect(@ls.game_teams).to be_an Array
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
    xit "returns name of team with highest avg score per game across all seasons while away" do
      expect(@ls.highest_scoring_visitor).to eq("FC Dallas")
    end
  end

  describe "#highest_scoring_home_team" do
    it "returns name of team with highest avg score per game across all seasons while home" do

    end
  end

  describe "#lowest_scoring_visitor" do
    it "returs name of team with lowest avg score per game across all seasons while a visitor" do

    end
  end

  describe "#lowest_scoring_home_team" do
    it "returns name of team with lowest avg score per game across all seasons while home" do

    end
  end

  describe "#average_goals_by_game" do
    it "returns a hash of team_ids and average goals per game given a subset of GameTeams objects" do
      expect(@ls.average_goals_by_team(@ls.game_teams)["3"]).to eq(2.1261770244821094)
    end
  end
end