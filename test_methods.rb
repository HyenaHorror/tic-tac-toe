require "minitest/autorun"
require_relative "methods.rb"

class TicTacToe_Test < Minitest::Test
  def test_bool
    assert_equal(true,true)
  end
  def test_empty_board
    expected = {
      "A1" => " ",
      "A2" => " ",
      "A3" => " ",
      "B1" => " ",
      "B2" => " ",
      "B3" => " ",
      "C1" => " ",
      "C2" => " ",
      "C3" => " "
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
      "A1" => "X", "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_make_move_b3_o
    b = Board.new
    b.make_move("O", "B3")
    actual = b.return_board

    expected = {
      "A1" => " ", "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => " ",  "B3" => "O",
      "C1" => " ",  "C2" => " ",  "C3" => " "
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

  def test_horizontal_win_a
    b = Board.new
    b.make_move("X", "A1")
    b.make_move("X", "A2")
    b.make_move("X", "A3")
    b.check_win
    actual = b.check_win
    expected = true
    assert_equal(expected, actual)
  end
  def test_horizontal_win_b
    b = Board.new
    b.make_move("O", "B1")
    b.make_move("O", "B2")
    b.make_move("O", "B3")
    b.check_win
    actual = b.check_win
    expected = true
    assert_equal(expected, actual)
  end
  def test_horizontal_win_c
    b = Board.new
    b.make_move("X", "C1")
    b.make_move("X", "C2")
    b.make_move("X", "C3")
    b.check_win
    actual = b.check_win
    expected = true
    assert_equal(expected, actual)
  end
  def test_vertical_win_1
    b = Board.new
    b.make_move("X", "A1")
    b.make_move("X", "B1")
    b.make_move("X", "C1")
    b.check_win
    actual = b.check_win
    expected = true
    assert_equal(expected, actual)
  end
  def test_vertical_win_2
    b = Board.new
    b.make_move("O", "A2")
    b.make_move("O", "B2")
    b.make_move("O", "C2")
    b.check_win
    actual = b.check_win
    expected = true
    assert_equal(expected, actual)
  end
  def test_vertical_win_3
    b = Board.new
    b.make_move("X", "A3")
    b.make_move("X", "B3")
    b.make_move("X", "C3")
    b.check_win
    actual = b.check_win
    expected = true
    assert_equal(expected, actual)
  end
end
