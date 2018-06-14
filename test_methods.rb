require "minitest/autorun"
require_relative "methods.rb"

class TicTacToe_Test < Minitest::Test
  def test_bool
    assert_equal(true,true)
  end
  def test_empty_board
    expected = {
      :A1 => "",
      :A2 => "",
      :A3 => "",
      :B1 => "",
      :B2 => "",
      :B3 => "",
      :C1 => "",
      :C2 => "",
      :C3 => ""
    }
    actual = Board.new.return_board
    puts Board.new
    assert_equal(expected, actual)
  end
end
