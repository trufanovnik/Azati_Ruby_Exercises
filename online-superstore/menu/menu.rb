require_relative "prompt.rb"

module Prompt
  @name = @prompt.ask('Как Вас зовут?')
  if @name == 'admin'
    load "admin_menu.rb"
  else
    load "customer_menu.rb"
  end
end
