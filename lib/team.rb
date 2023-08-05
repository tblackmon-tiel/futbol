class Team
  attr_reader :team_id,
    :franchise_id,
    :team_name,
    :abbreviation,
    :stadium,
    :link

  def initialize(data)
    @team_id = data[:team_id]
    @franchise_id = data[:franchiseid]
    @team_name = data[:teamname]
    @abbreviation = data[:abbreviation]
    @stadium = data[:stadium]
    @link = data[:link]
  end
end
