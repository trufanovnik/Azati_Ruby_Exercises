require_relative "../menu/prompt.rb"

@prompt = TTY::Prompt.new
require 'csv'
#menu for admin

case @prompt.select("Какой товар добавить в магазин?", %w(Book Game ComputerGame), cycle: true)
when "Book"
  @new_book = Book.new
  @new_book.name = @prompt.ask("Название книги")
  @new_book.description = @prompt.ask("Краткое описание товара")
  @new_book.pages = @prompt.ask("Количество страниц")
  @new_book.genre = @prompt.ask("Жанр")
  @new_book.price = @prompt.ask("Цена")
  case @prompt.select("Выберите действие", %w(ДобавитьТовар Назад))
  when "ДобавитьТовар"
    CSV.open("../store/books.csv", "a") do |wr|
      wr << [@new_book.name, @new_book.description, @new_book.pages, @new_book.genre, @new_book.price]
    end
  when "Назад"
    load "../menu/admin_menu.rb"
  end
when "Game"
  @new_game = Game.new
  @new_game.name = @prompt.ask("Название игры")
  @new_game.description = @prompt.ask("Краткое описание товара")
  @new_game.age_limit = @prompt.select("Для кого игра?", %w(Дети Подростки Взрослые))
  @new_game.number_of_players = @prompt.select("Сколько игроков?", %w(1-2 2-4 4-8))
  @new_game.price = @prompt.ask("Цена")
  case @prompt.select("Выберите действие", %w(ДобавитьТовар Назад))
  when "ДобавитьТовар"
    CSV.open("../store/games.csv", "a") do |wr|
      wr << [@new_game.name, @new_game.description, @new_game.age_limit, @new_game.number_of_players, @new_game.price]
    end
  when "Назад"
    load "../menu/admin_menu.rb"
  end
when "ComputerGame"
  @new_comp_game = ComputerGame.new
  @new_comp_game.name = @prompt.ask("Название игры")
  @new_comp_game.description = @prompt.ask("Краткое описание товара")
  @new_comp_game.pg = @prompt.select("PG", %w(0+ 16+ 18+))
  @new_comp_game.platform = @prompt.multi_select("Платформа", %w(PC Xbox PS smatphone))
  @new_comp_game.price = @prompt.ask("Цена")
  case @prompt.select("Выберите действие", %w(ДобавитьТовар Назад))
  when "ДобавитьТовар"
    CSV.open("../store/computer_games.csv", "a") do |wr|
      wr << [@new_comp_game.name, @new_comp_game.description, @new_comp_game.pg, @new_comp_game.platform, @new_comp_game.price]
    end
  when "Назад"
    load "../menu/admin_menu.rb"
  end
end
