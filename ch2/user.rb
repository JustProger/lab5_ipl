# frozen_string_literal: true

require_relative 'main'

p 'Введите фамилии работников цеха через пробел:'
fam = gets.chomp

p 'Введите зарплаты соответствующих работников цеха через пробел:'
salary = gets.chomp

# hash = {"i"=>3, "g2"=>2, "you"=>23, "first"=>40, "sec"=>36, "me"=>56}
res = Main.process(fam, salary)
p "Фамилия работника, зарплата которого наименее откланяется от зарплаты всех работников: #{res[0]}"
p "Фамилии двух работников с наибольшей зарплатой: #{res[1]} и #{res[2]} соответственно"
p 'Новые ведомости:'
res[-1].each do |k, v|
  p "Фамилия: #{k}, зарплата: #{v}"
end
