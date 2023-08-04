require "csv"
require "./lib/game"
require "./lib/team"
require "./lib/game_teams"

class StatDaddy
  attr_reader :games,
    :teams,
    :game_teams

  def initialize(locations)
    @games = CSV.open(locations[:games], headers: true, header_converters: :symbol).map do |game|
      Game.new(game)
    end
    @teams = CSV.open(locations[:teams], headers: true, header_converters: :symbol).map do |team|
      Team.new(team)
    end
    @game_teams = CSV.open(locations[:game_teams], headers: true, header_converters: :symbol).map do |game_team|
      GameTeams.new(game_team)
    end
  end
end
