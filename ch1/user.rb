# frozen_string_literal: true

require_relative 'main'

puts 'Введите x:'
x = gets.chomp
puts "Результат: #{Main.func(x)}"
