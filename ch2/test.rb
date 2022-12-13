# frozen_string_literal: true

require 'minitest/autorun'
require 'faker'
require_relative 'main'

# Test process method
class TestProcess < MiniTest::Test
  def setup
    rand_int = Random.rand(3..6)
    @fam = (1..rand_int).map(&:to_s)
    @salary = (1..rand_int).collect { Faker::Number.within(range: 10_000.0..80_000.0).round(2) }
    @salary.sort!

    average = @salary.sum / @salary.size
    hash = {}
    @fam.each_with_index { |elem, ind| hash[elem] = @salary[ind] }

    emp1 = (hash.min_by { |_k, value| (value - average).abs })[0]
    emp2 = @fam[-1]
    emp3 = @fam[-2]
    emp4 = @fam[0]

    hash[emp4] = 'deleted'

    @fam = @fam.join(' ')
    @salary = @salary.join(' ')
    @data = [emp1, emp2, emp3, hash]
  end

  def test_process_errors
    assert_raises(TypeError) { Main.process('a b c', '12 b .989') }
    assert_raises(ArgumentError) { Main.process('a b c', '12 5 .989 30') }
  end

  def test_process
    assert_equal ['f', 'e', 'f', { 'a' => 'deleted', 'b' => 35.0, \
                                   'c' => 1.55, 'd' => 5.432, 'e' => 345.0, 'f' => 45.0 }], \
                 Main.process('a b c d e f', '. 35 1.55 5.432     345 45')
  end

  def test_process_with_faker
    assert_equal [@data[0], @data[1], @data[2], @data[3]], \
                 Main.process(@fam, @salary)
  end
end
