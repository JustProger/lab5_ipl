# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

# Test func function
class TestFunc < MiniTest::Test
  def test_domain
    assert_raises(ZeroDivisionError) { Main.func(2) }
    assert_raises(Math::DomainError) { Main.func(1.5) }
  end

  def test_maths
    assert_in_delta 44.1, Main.func(3), 0.1
    assert_in_delta 28.6, Main.func(2.25), 0.1
    assert_in_delta 49.7, Main.func(2.005), 0.1
  end
end
