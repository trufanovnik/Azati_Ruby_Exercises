require_relative "../menu/prompt.rb"

@prompt = TTY::Prompt.new
require 'csv'

case @prompt.select("Из какой категории выбрать товар для удаления?", %w(Book Game ComputerGame Назад), cycle: true)
when "Book"
  @table = CSV.table("../store/books.csv", headers: true)
  @book_for_delete = @prompt.select("Какую книгу удалить из магазина?", @table[:name])
  @table.delete_if do |row|
    row[:name] == @book_for_delete
  end
  File.open("../store/books.csv", 'w') do |f|
    f.write(@table.to_csv)
  end
  puts "Книга #{@book_for_delete} удалена!"
  load "../menu/admin_menu.rb"
when "Game"
  @table = CSV.table("../store/games.csv", headers: true)
  @game_for_delete = @prompt.select("Какую игру удалить из магазина?", @table[:name])
  @table.delete_if do |row|
    row[:name] == @game_for_delete
  end
  File.open("../store/games.csv", 'w') do |f|
    f.write(@table.to_csv)
  end
  puts "Игра #{@game_for_delete} удалена!"
  load "../menu/admin_menu.rb"
when "ComputerGame"
  @table = CSV.table("../store/computer_games.csv", headers: true)
  @comp_game_for_delete = @prompt.select("Какую компьютерную игру удалить из магазина?", @table[:name])
  @table.delete_if do |row|
    row[:name] == @comp_game_for_delete
  end
  File.open("../store/computer_game.csv", 'w') do |f|
    f.write(@table.to_csv)
  end
  puts "Компьютерная игра #{@comp_game_for_delete} удалена!"
  load "../menu/admin_menu.rb"
when "Назад"
  load "../menu/admin_menu.rb"
end
