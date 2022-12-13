# frozen_string_literal: true

require 'minitest/autorun'
require 'faker'
require_relative 'main'

# При проведении теста test_process_strs пользователь вводит слова "замена$",
# где $ - 1, увеличивается на 1 с каждым вводом
class TestProcess < MiniTest::Test
  def setup
    num_of_sentences = 4
    num_of_words = Random.rand(2..5)
    # Массив, каждый нечётный элемент - строка, в которой каждое второе слово начинается с буквы "e"
    # каждый чётный элемент - строка, в которой каждое второе слово начинается с буквы "c"
    # используется латиница
    @test_1_input_temp = Array.new(num_of_sentences, Array.new(num_of_words, ''))
    @test_1_input = @test_1_input_temp.clone
    @test_1_output = @test_1_input.clone

    @test_1_input_temp.each_with_index do |word_arr, str_ind|
      if str_ind.even? # если индекс строки чётный, то каждое 2-е слово начинается с буквы "е"
        word_arr.each_with_index do |_word, word_ind|
          loop do
            word_arr[word_ind] = Faker::Lorem.word
            break if word_ind.even? && word_arr[word_ind][0] != 'e' || word_ind.odd? && word_arr[word_ind][0] == 'e'
          end
        end
      else # если индекс строки нечётный, то каждое 2-е слово начинается с буквы "с"
        word_arr.each_with_index do |_word, word_ind|
          loop do
            word_arr[word_ind] = Faker::Lorem.word
            break if word_ind.even? && word_arr[word_ind][0] != 'c' || word_ind.odd? && word_arr[word_ind][0] == 'c'
          end
        end
      end
      @test_1_input[str_ind] = word_arr.join(' ')
    end

    @test_1_input.each_with_index do |str, ind|
      res = if ind.even? # т. е. это строка, где каждое 2-е слово начинается с "e" (удаление)
              str.split(' ').reject { |word| word[0] == 'e' }.join(' ')
            else # т. е. это строка, где каждое 2-е слово начинается с "c" (замена)
              str.split(' ').map do |word|
                if word[0] != 'c'
                  word
                else
                  'replace'
                end
              end.join(' ')
            end
      @test_1_output[ind] = res
    end

    puts 'Логи:'
    puts '----- Строки ввода:', @test_1_input
    puts '----- Ожидаемый результат:', @test_1_output
  end

  def test_process_strs
    assert_equal @test_1_output, Main.process_strs(@test_1_input, 'replace')
  end
end
