require "minitest/autorun"
require_relative "board.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "game.rb"

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
    assert_equal(expected, actual)
  end
  def test_empty_board_fail
    expected = {
      "A1" => "X", "A2" => "X",  "A3" => "O",
      "B1" => " ",  "B2" => "X",  "B3" => "O",
      "C1" => "O",  "C2" => " ",  "C3" => "X"
    }
    actual = Board.new.return_board
    refute_equal(expected, actual)
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
  def test_make_move_c2_x
    b = Board.new
    b.make_move("X", "C2")
    actual = b.return_board

    expected = {
      "A1" => " ", "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => "X",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_make_move_b1_o
    b = Board.new
    b.make_move("O", "B1")
    actual = b.return_board

    expected = {
      "A1" => " ", "A2" => " ",  "A3" => " ",
      "B1" => "O",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_make_move_a3_x
    b = Board.new
    b.make_move("X", "A3")
    actual = b.return_board

    expected = {
      "A1" => " ", "A2" => " ",  "A3" => "X",
      "B1" => " ",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_make_move_c1_o
    b = Board.new
    b.make_move("O", "C1")
    actual = b.return_board

    expected = {
      "A1" => " ", "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => " ",  "B3" => " ",
      "C1" => "O",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_make_move_multi_1
    b = Board.new

    b.make_move("X", "A1")
    b.make_move("O", "C1")
    b.make_move("X", "A2")
    b.make_move("O", "A3")
    b.make_move("X", "B2")
    b.make_move("O", "B3")
    b.make_move("X", "C3")
    actual = b.return_board

    expected = {
      "A1" => "X", "A2" => "X",  "A3" => "O",
      "B1" => " ",  "B2" => "X",  "B3" => "O",
      "C1" => "O",  "C2" => " ",  "C3" => "X"
    }
    assert_equal(expected, actual)
  end
  def test_make_move_multi_2
    b = Board.new

    b.make_move("X", "B2")
    b.make_move("O", "C1")
    b.make_move("X", "A2")
    b.make_move("O", "C2")
    b.make_move("X", "B1")
    b.make_move("O", "C3")
    actual = b.return_board

    expected = {
      "A1" => " ", "A2" => "X",  "A3" => " ",
      "B1" => "X",  "B2" => "X",  "B3" => " ",
      "C1" => "O",  "C2" => "O",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_make_move_multi_fail
    b = Board.new

    b.make_move("X", "A1")
    b.make_move("O", "C1")
    b.make_move("X", "A2")
    b.make_move("O", "A3")
    b.make_move("X", "B2")
    b.make_move("O", "B3")
    b.make_move("X", "C3")
    actual = b.return_board

    expected = {
      "A1" => "X", "A2" => "X",  "A3" => "X",
      "B1" => "X",  "B2" => "X",  "B3" => "X",
      "C1" => "X",  "C2" => "X",  "C3" => "X"
    }
    refute_equal(expected, actual)
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
  def test_horizontal_fail_a
    b = Board.new
    b.make_move("O", "A1")
    b.make_move("X", "A2")
    b.make_move("O", "A3")
    b.check_win
    actual = b.check_win
    expected = false
    assert_equal(expected, actual)
  end
  def test_horizontal_fail_b
    b = Board.new
    b.make_move("O", "B1")
    b.make_move("O", "B2")
    b.make_move("X", "B3")
    b.check_win
    actual = b.check_win
    expected = false
    assert_equal(expected, actual)
  end
  def test_horizontal_fail_c
    b = Board.new
    b.make_move("O", "C1")
    b.make_move("X", "C2")
    b.make_move("X", "C3")
    b.check_win
    actual = b.check_win
    expected = false
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
  def test_vertical_fail_1
    b = Board.new
    b.make_move("X", "A1")
    b.make_move("O", "B1")
    b.make_move("X", "C1")
    b.check_win
    actual = b.check_win
    expected = false
    assert_equal(expected, actual)
  end
  def test_vertical_fail_2
    b = Board.new
    b.make_move("X", "A2")
    b.make_move("O", "B2")
    b.make_move("O", "C2")
    b.check_win
    actual = b.check_win
    expected = false
    assert_equal(expected, actual)
  end
  def test_vertical_fail_3
    b = Board.new
    b.make_move("X", "A3")
    b.make_move("O", "B3")
    b.make_move("O", "C3")
    b.check_win
    actual = b.check_win
    expected = false
    assert_equal(expected, actual)
  end
  def test_diagonal_win_1
    b = Board.new
    b.make_move("X", "A1")
    b.make_move("X", "B2")
    b.make_move("X", "C3")
    b.check_win
    actual = b.check_win
    expected = true
    assert_equal(expected, actual)
  end
  def test_diagonal_win_2
    b = Board.new
    b.make_move("O", "A3")
    b.make_move("O", "B2")
    b.make_move("O", "C1")
    b.check_win
    actual = b.check_win
    expected = true
    assert_equal(expected, actual)
  end
  def test_diagonal_fail_1
    b = Board.new
    b.make_move("X", "A1")
    b.make_move("O", "B2")
    b.make_move("X", "C3")
    b.check_win
    actual = b.check_win
    expected = false
    assert_equal(expected, actual)
  end
  def test_diagonal_fail_2
    b = Board.new
    b.make_move("O", "A3")
    b.make_move("X", "B2")
    b.make_move("X", "C1")
    b.check_win
    actual = b.check_win
    expected = false
    assert_equal(expected, actual)
  end
  def test_draw_1
    b = Board.new
    b.make_move("X", "A1")
    b.make_move("O", "B2")
    b.make_move("X", "C1")
    b.make_move("O", "B1")
    b.make_move("X", "B3")
    b.make_move("O", "C2")
    b.make_move("X", "A2")
    b.make_move("O", "A3")
    b.make_move("X", "C3")
    b.check_win
    actual = b.check_draw
    expected = true
    assert_equal(expected, actual)
  end
  def test_draw_2
    b = Board.new
    b.make_move("X", "B2")
    b.make_move("O", "A3")
    b.make_move("X", "B1")
    b.make_move("O", "B3")
    b.make_move("X", "C3")
    b.make_move("O", "A1")
    b.make_move("X", "A2")
    b.make_move("O", "C2")
    b.make_move("X", "C1")
    b.check_win
    actual = b.check_draw
    expected = true
    assert_equal(expected, actual)
  end
  def test_draw_3
    b = Board.new
    b.make_move("X", "A1")
    b.make_move("O", "B2")
    b.make_move("X", "A3")
    b.make_move("O", "A2")
    b.make_move("X", "C2")
    b.make_move("O", "B3")
    b.make_move("X", "B1")
    b.make_move("O", "C1")
    b.make_move("X", "C3")
    b.check_win
    actual = b.check_draw
    expected = true
    assert_equal(expected, actual)
  end

  def test_rand_ai_valid_pos1
    position = RandomAI.new.choose_position

    a = position[0].ord >= 65 && position[0].ord <= 67
    b = position[1].to_i >= 1 && position[1].to_i <= 3
    actual = a && b
    assert_equal(true, actual)
  end
  def test_rand_ai_valid_pos2
    position = RandomAI.new.choose_position

    a = position[0].ord >= 65 && position[0].ord <= 67
    b = position[1].to_i >= 1 && position[1].to_i <= 3
    actual = a && b
    assert_equal(true, actual)
  end
  def test_rand_ai_valid_pos3
    position = RandomAI.new.choose_position

    a = position[0].ord >= 65 && position[0].ord <= 67
    b = position[1].to_i >= 1 && position[1].to_i <= 3
    actual = a && b
    assert_equal(true, actual)
  end
  def test_rand_ai_valid_pos4
    position = RandomAI.new.choose_position

    a = position[0].ord >= 65 && position[0].ord <= 67
    b = position[1].to_i >= 1 && position[1].to_i <= 3
    actual = a && b
    assert_equal(true, actual)
  end
  def test_rand_ai_valid_pos5
    position = RandomAI.new.choose_position

    a = position[0].ord >= 65 && position[0].ord <= 67
    b = position[1].to_i >= 1 && position[1].to_i <= 3
    actual = a && b
    assert_equal(true, actual)
  end
  def test_rand_ai_valid_pos6
    position = RandomAI.new.choose_position

    a = position[0].ord >= 65 && position[0].ord <= 67
    b = position[1].to_i >= 1 && position[1].to_i <= 3
    actual = a && b
    assert_equal(true, actual)
  end

  def test_game_set_player_x
    game = Game.new
    actual = game.set_player("X")
    expected = "X"
    assert_equal(expected, actual)
  end
  def test_game_set_player_o
    game = Game.new
    actual = game.set_player("o")
    expected = "O"
    assert_equal(expected, actual)
  end
  def test_game_set_player_x_fail
    game = Game.new
    actual = game.set_player("xxx")
    expected = "X"
    refute_equal(expected, actual)
  end
  def test_game_set_player_o_fail
    game = Game.new
    actual = game.set_player("ooo")
    expected = "O"
    refute_equal(expected, actual)
  end

  def test_alternate_player_o_from_x
    game = Game.new
    actual = game.alt_player
    expected = "O"
    assert_equal(expected, actual)
  end
  def test_alternate_player_x_from_o
    game = Game.new
    game.set_player("O")
    actual = game.alt_player
    expected = "X"
    assert_equal(expected, actual)
  end
  def test_alternate_player_fail_1
    game = Game.new
    game.set_player("O")
    actual = game.alt_player
    expected = "O"
    refute_equal(expected, actual)
  end
  def test_alternate_player_fail_2
    game = Game.new
    actual = game.alt_player
    expected = "X"
    refute_equal(expected, actual)
  end

  # def test_sequential_ai_solo_1
  #   game = Game.new
  #   until @valid_move != "Invalid move!"
  #     @valid_move = SequentialAI.new.make_move(game, "X")
  #   end
  #   actual = game.return_board
  #   expected = {
  #     "A1" => "X",  "A2" => "X",  "A3" => "X",
  #     "B1" => "X",  "B2" => "X",  "B3" => "X",
  #     "C1" => "X",  "C2" => "X",  "C3" => "X"
  #   }
  #   assert_equal(expected, actual)
  # end
  # def test_sequential_ai_solo_2
  #   game = Game.new
  #   until @valid_move != "Invalid move!"
  #     @valid_move = SequentialAI.new.make_move(game, "O")
  #   end
  #   actual = game.return_board
  #   expected = {
  #     "A1" => "O",  "A2" => "O",  "A3" => "O",
  #     "B1" => "O",  "B2" => "O",  "B3" => "O",
  #     "C1" => "O",  "C2" => "O",  "C3" => "O"
  #   }
  #   assert_equal(expected, actual)
  # end

  def test_seqai_one_turn
    game = Game.new
    SequentialAI.new.make_move(game, "O")
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_seqai_one_turn2
    game = Game.new
    game.make_move("X", "A1")
    SequentialAI.new.make_move(game, "O")
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => " ",
      "B1" => " ",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_seqai_one_at_a_time
    game = Game.new
    game.make_move("X", "A1")
    SequentialAI.new.make_move(game, "O")
    game.make_move("X", "A3")
    SequentialAI.new.make_move(game, "O")
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => "X",
      "B1" => "O",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_seqai_fill_board_1
    game = Game.new
    9.times do
      SequentialAI.new.make_move(game, "O")
    end
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => "O",  "A3" => "O",
      "B1" => "O",  "B2" => "O",  "B3" => "O",
      "C1" => "O",  "C2" => "O",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_seqai_fill_board_1
    game = Game.new
    9.times do
      SequentialAI.new.make_move(game, "X")
    end
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "X",  "A3" => "X",
      "B1" => "X",  "B2" => "X",  "B3" => "X",
      "C1" => "X",  "C2" => "X",  "C3" => "X"
    }
    assert_equal(expected, actual)
  end

end
