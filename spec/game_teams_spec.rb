require 'spec_helper'
require 'csv'

RSpec.describe GameTeams do
  before(:each) do
    @game_teams_path = "./data/games_teams_fixture.csv"
    @game_teams_csv = CSV.open(@game_teams_path, headers: true, header_converters: :symbol)
    @lines = @game_teams_csv.map { |line| line }
    @game_teams = GameTeams.new(@lines[0])
  end

  describe "#initialize" do
    it "exists" do
      expect(@game_teams).to be_a GameTeams
    end

    it "has readable attributes from a given hash" do
      expect(@game_teams.game_id).to eq("2012030221")
      expect(@game_teams.team_id).to eq("3")
      expect(@game_teams.hoa).to eq("away")
      expect(@game_teams.result).to eq("LOSS")
      expect(@game_teams.settled_in).to eq("OT")
      expect(@game_teams.head_coach).to eq("John Tortorella")
      expect(@game_teams.goals).to eq("2")
      expect(@game_teams.shots).to eq("8")
      expect(@game_teams.tackles).to eq("44")
      expect(@game_teams.pim).to eq("8")
      expect(@game_teams.power_play_opportunities).to eq("3")
      expect(@game_teams.power_play_goals).to eq("0")
      expect(@game_teams.face_off_win_percentage).to eq("44.8")
      expect(@game_teams.giveaways).to eq("17")
      expect(@game_teams.takeaways).to eq("7")
    end
  end
end