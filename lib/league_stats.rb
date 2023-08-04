require './lib/stat_daddy'

class LeagueStats < StatDaddy
  def count_of_teams
    @teams.count
  end

  def best_offense
    goals_by_team = Hash.new(0)
    @game_teams.each do |game|
      require 'pry';binding.pry
      goals_by_team[:game[:team_id]] += game[:goals]
    end
    require 'pry';binding.pry
  end

  def worst_offense

  end

  def highest_scoring_visitor

  end

  def highest_scoring_home_team

  end

  def lowest_scoring_visitor

  end

  def lowest_scoring_home_team

  end
end