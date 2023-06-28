require_relative 'item.rb'

class Book < Item
  attr_accessor :pages, :genre

  def initialize
    super
    @pages = pages
    @genre = genre
  end
end
