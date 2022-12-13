# frozen_string_literal: true

# Description of Main ...
class Main
  def self.check_input(fam, salary)
    fam = fam.split(' ')
    res = salary.scan(/[^\d. ]/)
    # return ['', '', 'Вы ввели неверный формат зарплаты работников!'] unless res.empty?
    raise TypeError, 'Вводятся положительные вещественные числа!' unless res.empty?

    salary = salary.split(' ').map(&:to_f)
    # return ['', '', 'Количество работников и зарплат должно совпадать!'] if fam.size != salary.size
    raise ArgumentError, 'Количество работников и зарплат должно совпадать!' unless fam.size == salary.size

    p 'Введённые ведомости:'
    p fam, salary
    [fam, salary]
  end

  def self.make_hash_find_average(fam, salary)
    hash = {}
    fam.each_with_index { |elem, ind| hash[elem] = salary[ind] }
    average = hash.values.sum / hash.size

    [hash, average]
  end

  def self.employees_and_changed_hash(hash, average)
    emp1 = hash.min_by { |_k, value| (value - average).abs }
    emp2, emp3 = hash.max_by(2) { |_k, value| value }
    emp4 = hash.min_by { |_k, value| value }
    hash[emp4[0]] = 'deleted'

    [emp1[0], emp2[0], emp3[0], hash]
  end

  def self.process(fam, salary)
    fam, salary = check_input(fam, salary)

    hash, average = make_hash_find_average(fam, salary)

    employees_and_changed_hash(hash, average)
  end
end
