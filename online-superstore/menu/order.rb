module Prompt
  puts @order.inspect
  case @prompt.select("Выберите действие", %w(ОформитьЗаказ ОчиститьКорзину Меню Выйти))
  when "ОформитьЗаказ"
    if @order
      @check = @order.map { |item| "Товар: #{item[0][0]}, цена: #{item[0][-1]}" }
      puts @check
    else
      puts "Корзина пуста"
    end
    load 'customer_menu.rb'
  when "ОчиститьКорзину"
    @order = []
    puts "Ваша корзина пуста"
  when "Меню"
    load 'customer_menu.rb'
  when "Выйти"
    abort "Досвидания!"
  end
end