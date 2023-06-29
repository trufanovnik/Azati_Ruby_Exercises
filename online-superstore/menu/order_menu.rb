module Prompt
  if @customer_choice == "Назад"
    load 'customer_menu.rb'
  end
  @items = CSV.table('../store/' + "#{@customer_choice}" + '.csv', headers: true)
  @converted_items = @items.map { |row| row.to_s}
  @items_to_order = @prompt.multi_select("Выберите товары", @converted_items, cycle: true)
  @order << @items_to_order.map { |el| el.split(',') }
  load 'buy_menu.rb'
end
