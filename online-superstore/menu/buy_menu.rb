module Prompt
  @customer_choice = @prompt.select('Выберите категорию товара', %w(books games computer_games Назад))
  if @customer_choice == "Назад"
    load 'customer_menu.rb'
  end
  load 'order_menu.rb'
end
