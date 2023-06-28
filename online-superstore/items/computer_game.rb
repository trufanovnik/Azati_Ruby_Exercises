require_relative 'item.rb'

class ComputerGame < Item
  attr_accessor :pg, :platform

  def initialize
    super
    @pg = pg
    @platform = platform
  end
end
