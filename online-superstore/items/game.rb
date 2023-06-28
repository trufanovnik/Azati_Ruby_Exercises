require_relative 'item.rb'

class Game < Item
  attr_accessor :age_limit, :number_of_players

  def initialize
    super
    @age_limit = age_limit
    @number_of_players = number_of_players
  end
end
