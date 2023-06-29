require "../items/item.rb"
require "../items/book.rb"
require "../items/computer_game.rb"
require "../items/game.rb"

module Prompt
  case @prompt.select("Выыберите действие", %w(ДобавитьТовар УдалитьТовар Назад ВыйтиИзМагазина))
  when "ДобавитьТовар"
    load '../items/add_item_to_store.rb'
  when "УдалитьТовар"
    load '../items/remove_item_from_store.rb'
  when "Назад"
    load "../menu/menu.rb"
  when "ВыйтиИзМагазина"
    abort 'До Встречи!'
  end
end
