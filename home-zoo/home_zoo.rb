#Первый вариант
class Animal
  def initialize(sound= "Bark", weigh= "7", color= "Grey")
    @sound, @weigh, @color = sound, weigh, color
  end

  def talk
    @sound
  end

  def wool_color
    @color
  end

  def weigh
    @weigh
  end

  def animal_info
    "It's a #{wool_color} #{ARGV[1]} who weighs #{weigh} pounds and says #{talk}"
  end
end

puts 'Set Color'
color = STDIN.gets
puts 'Set sound'
sound = STDIN.gets
puts 'Set weigh'
weigh = STDIN.gets

p Animal.new(sound, weigh, color).send ARGV[0].to_sym

#Второй вариант
# class Animal
#   def animal_info(color, sound, weigh)
#     "It's a #{color} #{ARGV[1]} who weighs #{weigh} pounds and says #{sound}"
#   end
# end

# puts 'Set Color'
# color = STDIN.gets
# puts 'Set sound'
# sound = STDIN.gets
# puts 'Set weigh'
# weigh = STDIN.gets

# p Animal.new.send ARGV[0].to_sym, color, sound, weigh