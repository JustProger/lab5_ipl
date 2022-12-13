# frozen_string_literal: true

# Description Main ...
class Main
  # Если слово стоит на четном месте и
  def self.check_e_word(word, ind)
    ind.odd? && word[0] == 'e' # начинается на букву «е» — оно удаляется
  end

  # Если слово стоит на четном месте и
  def self.check_c_word(word, ind, str_number)
    param = ind.odd? && word[0] == 'c' # начинается на букву «с» — оно заменяется на слово с клавиатуры
    puts "Замените слово ##{ind + 1} строки ##{str_number} на новое:" if param
    param
  end

  def self.process_str(str, str_number, replace_word)
    puts "Обработка строки ##{str_number}:"
    word_arr = str.split(' ')
    new_word_arr = word_arr.clone
    word_arr.each_with_index do |word, ind|
      new_word_arr[ind] = '' if check_e_word(word, ind)
      new_word_arr[ind] = replace_word if check_c_word(word, ind, str_number)
    end
    new_word_arr.select { |word| word unless word == '' }.join(' ')
  end

  def self.process_strs(strs, replace_word)
    new_strs = []
    strs.each_with_index { |str, ind| new_strs << process_str(str, ind + 1, replace_word) }
    new_strs
  end
end
