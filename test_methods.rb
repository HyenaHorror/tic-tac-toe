require "minitest/autorun"
require_relative "methods.rb"

class TicTacToe_Test < Minitest::Test
  def test_bool
    assert_equal(true,true)
  end
  def test_empty_board
    expected = {
      "A1" => "",
      "A2" => "",
      "A3" => "",
      "B1" => "",
      "B2" => "",
      "B3" => "",
      "C1" => "",
      "C2" => "",
      "C3" => ""
    }
    actual = Board.new.return_board
    puts Board.new
    assert_equal(expected, actual)
  end
  def test_make_move_a1_x
    b = Board.new
    b.make_move("X", "A1")
    actual = b.return_board

    expected = {
      "A1" => "X", "A2" => "",  "A3" => "",
      "B1" => "",  "B2" => "",  "B3" => "",
      "C1" => "",  "C2" => "",  "C3" => ""
    }
    assert_equal(expected, actual)
  end
  def test_make_move_b3_o
    b = Board.new
    b.make_move("O", "B3")
    actual = b.return_board

    expected = {
      "A1" => "", "A2" => "",  "A3" => "",
      "B1" => "",  "B2" => "",  "B3" => "O",
      "C1" => "",  "C2" => "",  "C3" => ""
    }
    assert_equal(expected, actual)
  end

  def test_bad_move_1
    b = Board.new
    b.make_move("X", "A1")
    actual = b.make_move("O", "A1")

    expected = "Invalid move!"
    assert_equal(expected, actual)
  end

end
