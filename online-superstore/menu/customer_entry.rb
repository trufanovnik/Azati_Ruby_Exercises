module Prompt
  puts "Введите свой email для входа в магазин:"
  @email = gets.chomp
  @customers = CSV.table('../customers/customers.csv', headers: true)
  @customer = @customers.find { |row| row[:name] == @name && row[:email] == @email }
  if @customer
    puts "Рады видеть вас снова, #{@name}"
  else
    puts "Укажите свой адрес, для доставки товаров"
    @address = gets.chomp
    @customers << [@name, @email, @address]
    CSV.open('../customers/customers.csv', 'w') do |csv|
      csv << @customers.headers
      @customers.each do |row|
        csv << row
      end
    end
    puts "Ваши данные были успешно добавлены!"
  end
  @order ||= []
end
