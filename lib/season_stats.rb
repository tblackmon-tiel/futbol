require "./lib/stat_daddy"

class SeasonStats < StatDaddy

  
    def winningest_coach
      coach_wins = Hash.new(0)
      coach_games = Hash.new(0)
  
      @games_teams_fixture.each do |data|
        coach = data[:head_coach]
        result = data[:result]
  
        if result == "WIN" || result == "OT"
          coach_wins[coach] += 1
        end
  
        coach_games[coach] += 1
      end
  
      highest_win_percentage = 0.0
      winningest_coach = nil
  
      coach_wins.each do |coach, wins|
        win_percentage = wins.to_f / coach_games[coach]
        if win_percentage > highest_win_percentage
          highest_win_percentage = win_percentage
          winningest_coach = coach
        end
      end
  require 'pry' ; binding.pry
      winningest_coach
    end 

  def worst_coach
    # Name of the Coach with the worst win percentage for the season
  end

  def most_accurate_team
    # Name of the Team with the best ratio of shots to goals for the season
  end

  def least_accurate_team
    # Name of the Team with the worst ratio of shots to goals for the season
  end

  def most_tackles
    # Name of the Team with the most tackles in the season
  end

  def fewest_tackles
    # Name of the Team with the fewest tackles in the season
  end
end
