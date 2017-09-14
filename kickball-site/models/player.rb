require_relative "./team_data"

class Player
  attr_reader :name, :position, :team_name

  def initialize(name,position,team_name)
    @name = name
    @position = position
    @team_name = team_name
  end
end
