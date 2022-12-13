# frozen_string_literal: true

# require 'faker'
require_relative 'main'

p 'Сколько строк вы хотите ввести?'
n = gets.chomp.to_i
p 'Введите слово замены:'
replace_word = gets.chomp
strs = []
n.times { strs << gets.chomp }
Main.process_strs(strs, replace_word).each { |str| puts str }
