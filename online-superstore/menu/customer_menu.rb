require "../items/item.rb"
require "../items/book.rb"
require "../items/computer_game.rb"
require "../items/game.rb"
require 'csv'

module Prompt
  load 'customer_entry.rb'
  case @prompt.select("Выыберите действие", %w(Купить ПосмотретьКорзину Назад ВыйтиИзМагазина))
  when "Купить"
    load 'buy_menu.rb'
  when "ПосмотретьКорзину"
    load 'order.rb'
  when "Назад"
    load 'menu.rb'
  when "ВыйтиИзМагазина"
    abort 'До Встречи!'
  end
end
