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
    @stat_tracker = StatTracker.from_csv(@locations)
    allow(@stat_tracker).to receive(:games).and_return(@games_fixture_path)
    allow(@stat_tracker).to receive(:game_teams).and_return(@game_teams_fixture_pathÍ)
    require 'pry';binding.pry
  end

  describe "#initialize" do
    it "exists" do
      expect(@ls).to be_a LeagueStats
    end

    it "has readable attributes for games data, teams data, and games_teams data" do
      expect
    end
  end

  describe "#count_of_teams" do
    it "returns total number of teams in the data" do

    end
  end

  describe "#best_offense" do
    it "returns name of team with highest avg goals scored per game across all seasons" do

    end
  end

  describe "#worst_offense" do
    it "returns name of team with lowest avg goals per game across all seasons" do

    end
  end

  describe "#highest_scoring_visitor" do
    it "returns name of team with highest avg score per game across all seasons while away" do

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
end