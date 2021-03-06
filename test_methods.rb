require "minitest/autorun"
require_relative "board.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "unbeatable_ai.rb"
require_relative "game.rb"
require_relative "player.rb"

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
      "A1" => "X",  "A2" => " ",  "A3" => " ",
      "B1" => "O",  "B2" => " ",  "B3" => " ",
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
      "A1" => "X",  "A2" => " ",  "A3" => "X",
      "B1" => "O",  "B2" => " ",  "B3" => " ",
      "C1" => "O",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_seqai_one_at_a_time_full
    game = Game.new

    4.times do
      SequentialAI.new.make_move(game, "X")
      SequentialAI.new.make_move(game, "O")
    end
    SequentialAI.new.make_move(game, "X")

    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => "X",
      "B1" => "O",  "B2" => "X",  "B3" => "O",
      "C1" => "X",  "C2" => "O",  "C3" => "X"
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
  def test_seqai_fill_board_2
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

  def test_player_init
    actual = Player.new.return
    expected = {:order => 1, :type => "HUMAN", :symbol => "X"}
    assert_equal(expected, actual)
  end

  def test_player_human_o
    player = Player.new
    player.set_symbol("o")
    actual = player.return
    expected = {:order => 1, :type => "HUMAN", :symbol => "O"}
    assert_equal(expected, actual)
  end

  def test_player_2_init
    player = Player.new(2, "o", "human")
    actual = player.return
    expected = {:order => 2, :type => "HUMAN", :symbol => "O"}
    assert_equal(expected, actual)
  end

  def test_game_check_players
    game = Game.new
    actual = game.return_players
    expected = [{:type => "HUMAN", :order => 1, :symbol => "X"},
      {:type => "HUMAN", :order => 2, :symbol => "O"}]
    assert_equal(expected, actual)
  end

  def test_set_player2_ai
    game = Game.new
    game.set_player_type(2, "RANDOM")
    actual = game.return_players[1]
    expected = {:type => "RANDOM", :order => 2, :symbol => "O"}
    assert_equal(expected, actual)
  end

  def test_get_human_input
    game = Game.new
    # game.set_player_type(1, "RANDOM")
    is_human = game.get_next_move
    unless is_human == "HUMAN"
      game.make_move("A1")
    end
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_get_random_input
    game = Game.new
    game.set_player_type(1, "RANDOM")
    game.make_move("O", "A1")
    game.make_move("O", "A2")
    game.make_move("O", "A3")
    game.make_move("O", "B1")
    game.make_move("O", "B3")
    game.make_move("O", "C1")
    game.make_move("O", "C2")
    game.make_move("O", "C3")
    game.get_next_move
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => "O",  "A3" => "O",
      "B1" => "O",  "B2" => "X",  "B3" => "O",
      "C1" => "O",  "C2" => "O",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_get_seqai_input
    game = Game.new
    game.set_player_type(1, "SEQUENTIAL")
    game.get_next_move
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_get_seqai_input_fail
    game = Game.new
    game.set_player_type(1, "SEQUENTIAL")
    game.get_next_move
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    refute_equal(expected, actual)
  end

  def test_unbeatable_take_win_horizontal_1
    game = Game.new
    game.alt_player
    game.make_move("X", "C1")
    game.make_move("X", "B2")
    game.make_move("X", "C2")
    game.make_move("O", "A1")
    game.make_move("O", "A2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => "O",  "A3" => "O",
      "B1" => " ",  "B2" => "X",  "B3" => " ",
      "C1" => "X",  "C2" => "X",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_take_win_horizontal_2
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "A2")
    game.make_move("X", "C2")
    game.make_move("O", "B1")
    game.make_move("O", "B3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "X",  "A3" => " ",
      "B1" => "O",  "B2" => "O",  "B3" => "O",
      "C1" => " ",  "C2" => "X",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_take_win_horizontal_3
    game = Game.new
    game.alt_player
    game.make_move("X", "A2")
    game.make_move("X", "B2")
    game.make_move("X", "B3")
    game.make_move("O", "C2")
    game.make_move("O", "C3")

    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => "X",  "A3" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => "X",
      "C1" => "O",  "C2" => "O",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_take_win_horizontal_1_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "C1")
    game.make_move("X", "B2")
    game.make_move("X", "C2")
    game.make_move("O", "A1")
    game.make_move("O", "A2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => "O",  "A3" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => "O",
      "C1" => "X",  "C2" => "X",  "C3" => " "
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_take_win_horizontal_2_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "A2")
    game.make_move("X", "C2")
    game.make_move("O", "B1")
    game.make_move("O", "B3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "X",  "A3" => " ",
      "B1" => "O",  "B2" => " ",  "B3" => "O",
      "C1" => " ",  "C2" => "X",  "C3" => "O"
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_take_win_horizontal_3_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A2")
    game.make_move("X", "B2")
    game.make_move("X", "B3")
    game.make_move("O", "C2")
    game.make_move("O", "C3")

    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => "X",  "A3" => "O",
      "B1" => " ",  "B2" => "X",  "B3" => "X",
      "C1" => " ",  "C2" => "O",  "C3" => "O"
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_take_win_vertical_1
    game = Game.new
    game.alt_player
    game.make_move("X", "A3")
    game.make_move("X", "B2")
    game.make_move("X", "C2")
    game.make_move("O", "B1")
    game.make_move("O", "C1")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => " ",  "A3" => "X",
      "B1" => "O",  "B2" => "X",  "B3" => " ",
      "C1" => "O",  "C2" => "X",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_take_win_vertical_2
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "C1")
    game.make_move("X", "C3")
    game.make_move("O", "A2")
    game.make_move("O", "C2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => " ",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => "X",  "C2" => "O",  "C3" => "X"
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_take_win_vertical_3
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "C1")
    game.make_move("X", "B2")
    game.make_move("O", "A3")
    game.make_move("O", "C3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => " ",  "A3" => "O",
      "B1" => " ",  "B2" => "X",  "B3" => "O",
      "C1" => "X",  "C2" => " ",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_take_win_vertical_1_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A3")
    game.make_move("X", "B2")
    game.make_move("X", "C2")
    game.make_move("O", "B1")
    game.make_move("O", "C1")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => "O",  "A3" => "X",
      "B1" => "O",  "B2" => "X",  "B3" => " ",
      "C1" => "O",  "C2" => "X",  "C3" => " "
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_take_win_vertical_2_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "C1")
    game.make_move("X", "C3")
    game.make_move("O", "A2")
    game.make_move("O", "C2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "O",  "B3" => "O",
      "C1" => "X",  "C2" => "O",  "C3" => "X"
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_take_win_vertical_3_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "C1")
    game.make_move("X", "B2")
    game.make_move("O", "A3")
    game.make_move("O", "B3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => "O",
      "B1" => " ",  "B2" => "X",  "B3" => " ",
      "C1" => "X",  "C2" => " ",  "C3" => "O"
    }
    refute_equal(expected, actual)
  end
  def test_string_prev_1
    assert_equal("ABCDD", "ABCDE".prev)
  end
  def test_string_prev_2
    assert_equal("TESS", "TEST".prev)
  end
  def test_string_prev_3
    assert_equal("Y", "Z".prev)
  end
  def test_string_prev_1_fail
    refute_equal("ABCDE", "ABCDE".prev)
  end
  def test_string_prev_2_fail
    refute_equal("TEST", "TEST".prev)
  end
  def test_string_prev_3_fail
    refute_equal("Z", "Z".prev)
  end
  def test_unbeatable_take_win_diagonal_1
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "C3")
    game.make_move("X", "B3")
    game.make_move("O", "A3")
    game.make_move("O", "C1")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => " ",  "A3" => "O",
      "B1" => " ",  "B2" => "O",  "B3" => "X",
      "C1" => "O",  "C2" => " ",  "C3" => "X"
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_take_win_diagonal_2
    game = Game.new
    game.alt_player
    game.make_move("X", "A3")
    game.make_move("X", "B3")
    game.make_move("X", "C2")
    game.make_move("O", "A1")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => " ",  "A3" => "X",
      "B1" => " ",  "B2" => "O",  "B3" => "X",
      "C1" => " ",  "C2" => "X",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_take_win_diagonal_3
    game = Game.new
    game.alt_player
    game.make_move("X", "A2")
    game.make_move("X", "B1")
    game.make_move("X", "C2")
    game.make_move("O", "C3")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => "X",  "A3" => " ",
      "B1" => "X",  "B2" => "O",  "B3" => " ",
      "C1" => " ",  "C2" => "X",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_take_win_diagonal_4
    game = Game.new
    game.alt_player
    game.make_move("X", "B1")
    game.make_move("X", "C2")
    game.make_move("X", "C3")
    game.make_move("O", "C1")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => "O",
      "B1" => "X",  "B2" => "O",  "B3" => " ",
      "C1" => "O",  "C2" => "X",  "C3" => "X"
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_take_win_diagonal_1_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "C3")
    game.make_move("X", "B3")
    game.make_move("O", "A3")
    game.make_move("O", "C1")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => " ",  "A3" => "O",
      "B1" => " ",  "B2" => " ",  "B3" => "X",
      "C1" => "O",  "C2" => " ",  "C3" => "X"
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_take_win_diagonal_2_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A3")
    game.make_move("X", "B3")
    game.make_move("X", "C2")
    game.make_move("O", "A1")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => " ",  "A3" => "X",
      "B1" => " ",  "B2" => "O",  "B3" => "X",
      "C1" => " ",  "C2" => "X",  "C3" => " "
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_take_win_diagonal_3_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A2")
    game.make_move("X", "B1")
    game.make_move("X", "C2")
    game.make_move("O", "C3")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => "X",  "A3" => " ",
      "B1" => "X",  "B2" => "O",  "B3" => " ",
      "C1" => " ",  "C2" => "X",  "C3" => "O"
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_take_win_diagonal_4_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "B1")
    game.make_move("X", "C2")
    game.make_move("X", "C3")
    game.make_move("O", "C1")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => " ",
      "B1" => "X",  "B2" => "O",  "B3" => " ",
      "C1" => "O",  "C2" => "X",  "C3" => "X"
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_block_win_horizontal_1
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "A2")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "X",  "A3" => "O",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_block_win_horizontal_2
    game = Game.new
    game.alt_player
    game.make_move("X", "B1")
    game.make_move("X", "B3")
    game.make_move("O", "A3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => "O",
      "B1" => "X",  "B2" => "O",  "B3" => "X",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_block_win_horizontal_3
    game = Game.new
    game.alt_player
    game.make_move("X", "C3")
    game.make_move("X", "C2")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => "O",  "C2" => "X",  "C3" => "X"
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_block_win_horizontal_1_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "A2")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "X",  "A3" => " ",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_block_win_horizontal_2_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "B1")
    game.make_move("X", "B3")
    game.make_move("O", "A3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => "O",
      "B1" => "X",  "B2" => " ",  "B3" => "X",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_block_win_horizontal_3_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "C3")
    game.make_move("X", "C2")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => " ",  "C2" => "X",  "C3" => "X"
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_block_win_vertical_1
    game = Game.new
    game.alt_player
    game.make_move("X", "B1")
    game.make_move("X", "C1")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => " ",  "A3" => " ",
      "B1" => "X",  "B2" => "O",  "B3" => " ",
      "C1" => "X",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_block_win_vertical_2
    game = Game.new
    game.alt_player
    game.make_move("X", "A2")
    game.make_move("X", "C2")
    game.make_move("O", "A1")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => "X",  "A3" => " ",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => " ",  "C2" => "X",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_block_win_vertical_3
    game = Game.new
    game.alt_player
    game.make_move("X", "A3")
    game.make_move("X", "B3")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => "X",
      "B1" => " ",  "B2" => "O",  "B3" => "X",
      "C1" => " ",  "C2" => " ",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_block_win_vertical_1_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "B1")
    game.make_move("X", "C1")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => " ",
      "B1" => "X",  "B2" => "O",  "B3" => " ",
      "C1" => "X",  "C2" => " ",  "C3" => " "
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_block_win_vertical_2_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A2")
    game.make_move("X", "C2")
    game.make_move("O", "A1")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => "X",  "A3" => " ",
      "B1" => " ",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => "X",  "C3" => " "
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_block_win_vertical_3_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "C3")
    game.make_move("X", "C2")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => "X",
      "B1" => " ",  "B2" => "O",  "B3" => "X",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_block_win_diagonal_1
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "B2")
    game.make_move("O", "B3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => "O",
      "C1" => " ",  "C2" => " ",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_block_win_diagonal_2
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "C3")
    game.make_move("O", "A2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => " ",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => "X"
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_block_win_diagonal_3
    game = Game.new
    game.alt_player
    game.make_move("X", "B2")
    game.make_move("X", "C1")
    game.make_move("O", "C2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => "O",
      "B1" => " ",  "B2" => "X",  "B3" => " ",
      "C1" => "X",  "C2" => "O",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_block_win_diagonal_4
    game = Game.new
    game.alt_player
    game.make_move("X", "A3")
    game.make_move("X", "B2")
    game.make_move("O", "B3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => "X",
      "B1" => " ",  "B2" => "X",  "B3" => "O",
      "C1" => "O",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_unbeatable_block_win_diagonal_1_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "B2")
    game.make_move("O", "B3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => "O",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_block_win_diagonal_2_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "C3")
    game.make_move("O", "A2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => " ",
      "B1" => " ",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => "X"
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_block_win_diagonal_3_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "B2")
    game.make_move("X", "C1")
    game.make_move("O", "C2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => " ",
      "C1" => "X",  "C2" => "O",  "C3" => " "
    }
    refute_equal(expected, actual)
  end
  def test_unbeatable_block_win_diagonal_4_fail
    game = Game.new
    game.alt_player
    game.make_move("X", "A3")
    game.make_move("X", "B2")
    game.make_move("O", "B3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => "X",
      "B1" => " ",  "B2" => "X",  "B3" => "O",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    refute_equal(expected, actual)
  end

  def test_find_center_3x3
    a = UnbeatableAI.new
    board = {
      "A1" => " ",  "A2" => " ",  "A3" => "X",
      "B1" => " ",  "B2" => "X",  "B3" => "O",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    actual = a.find_center(board, 3)
    expected = {
      :position => "B2",
      :piece => "X"
    }
    assert_equal(expected, actual)
  end
  def test_find_center_5x5
    a = UnbeatableAI.new
    board = {
      "A1" => " ",  "A2" => " ",  "A3" => "X", "A4" => " ", "A5" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => "O", "B4" => " ", "B5" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " ", "C4" => " ", "C5" => " ",
      "D1" => " ",  "D2" => " ",  "D3" => " ", "D4" => " ", "D5" => " ",
      "E1" => " ",  "E2" => " ",  "E3" => " ", "E4" => " ", "E5" => " ",
    }
    actual = a.find_center(board, 5)
    expected = {
      :position => "C3",
      :piece => " "
    }
    assert_equal(expected, actual)
  end
  def test_find_center_7x7
    a = UnbeatableAI.new
    board = {
      "A1" => " ",  "A2" => " ",  "A3" => "X", "A4" => " ", "A5" => " ", "A6" => " ", "A7" => "X",
      "B1" => " ",  "B2" => "X",  "B3" => "O", "B4" => " ", "B5" => " ", "B6" => " ", "B7" => "X",
      "C1" => " ",  "C2" => " ",  "C3" => " ", "C4" => "O", "C5" => " ", "C6" => " ", "C7" => "X",
      "D1" => " ",  "D2" => " ",  "D3" => " ", "D4" => "O", "D5" => " ", "D6" => " ", "D7" => "X",
      "E1" => " ",  "E2" => " ",  "E3" => " ", "E4" => " ", "E5" => " ", "E6" => " ", "E7" => "X",
      "F1" => " ",  "F2" => " ",  "F3" => " ", "F4" => " ", "F5" => " ", "F6" => " ", "F7" => "X",
      "G1" => " ",  "G2" => " ",  "G3" => " ", "G4" => " ", "G5" => " ", "G6" => " ", "G7" => "X",
    }
    actual = a.find_center(board, 7)
    expected = {
      :position => "D4",
      :piece => "O"
    }
    assert_equal(expected, actual)
  end
  def test_find_corners_3x3
    a = UnbeatableAI.new
    board = {
      "A1" => " ",  "A2" => " ",  "A3" => "X",
      "B1" => " ",  "B2" => "X",  "B3" => "O",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    actual = a.find_corners(board, 3)
    expected = {
      :top_left => {
        :position => "A1",
        :piece => " "
      },
      :top_right => {
        :position => "A3",
        :piece => "X"
      },
      :bottom_left => {
        :position => "C1",
        :piece => " "
      },
      :bottom_right => {
        :position => "C3",
        :piece => " "
      }
    }
    assert_equal(expected, actual)
  end
  def test_find_corners_5x5
    a = UnbeatableAI.new
    board = {
      "A1" => "X",  "A2" => " ",  "A3" => "X", "A4" => " ", "A5" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => "O", "B4" => " ", "B5" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " ", "C4" => " ", "C5" => " ",
      "D1" => " ",  "D2" => " ",  "D3" => " ", "D4" => " ", "D5" => " ",
      "E1" => "O",  "E2" => " ",  "E3" => " ", "E4" => " ", "E5" => " ",
    }
    actual = a.find_corners(board, 5)
    expected = {
      :top_left => {
        :position => "A1",
        :piece => "X"
      },
      :top_right => {
        :position => "A5",
        :piece => " "
      },
      :bottom_left => {
        :position => "E1",
        :piece => "O"
      },
      :bottom_right => {
        :position => "E5",
        :piece => " "
      }
    }
    assert_equal(expected, actual)
  end
  def test_find_corners_7x7
    a = UnbeatableAI.new
    board = {
      "A1" => " ",  "A2" => " ",  "A3" => "X", "A4" => " ", "A5" => " ", "A6" => " ", "A7" => "X",
      "B1" => " ",  "B2" => "X",  "B3" => "O", "B4" => " ", "B5" => " ", "B6" => " ", "B7" => "X",
      "C1" => " ",  "C2" => " ",  "C3" => " ", "C4" => "O", "C5" => " ", "C6" => " ", "C7" => "X",
      "D1" => " ",  "D2" => " ",  "D3" => " ", "D4" => "O", "D5" => " ", "D6" => " ", "D7" => "X",
      "E1" => " ",  "E2" => " ",  "E3" => " ", "E4" => " ", "E5" => " ", "E6" => " ", "E7" => "X",
      "F1" => " ",  "F2" => " ",  "F3" => " ", "F4" => " ", "F5" => " ", "F6" => " ", "F7" => "X",
      "G1" => "O",  "G2" => " ",  "G3" => " ", "G4" => " ", "G5" => " ", "G6" => " ", "G7" => "X",
    }
    actual = a.find_corners(board, 7)
    expected = {
      :top_left => {
        :position => "A1",
        :piece => " "
      },
      :top_right => {
        :position => "A7",
        :piece => "X"
      },
      :bottom_left => {
        :position => "G1",
        :piece => "O"
      },
      :bottom_right => {
        :position => "G7",
        :piece => "X"
      }
    }
    assert_equal(expected, actual)
  end
  def test_find_sides_3x3
    a = UnbeatableAI.new
    board = {
      "A1" => " ",  "A2" => "X",  "A3" => "X",
      "B1" => "O",  "B2" => "X",  "B3" => "O",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    actual = a.find_sides(board, 3)
    expected = {
      :top => [{
        :position => "A2",
        :piece => "X"
      }],
      :bottom => [{
        :position => "C2",
        :piece => " "
      }],
      :left => [{
        :position => "B1",
        :piece => "O"
      }],
      :right => [{
        :position => "B3",
        :piece => "O"
      }]
    }
    assert_equal(expected, actual)
  end
  def test_find_sides_5x5
    a = UnbeatableAI.new
    board = {
      "A1" => "X",  "A2" => " ",  "A3" => "X", "A4" => " ", "A5" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => "O", "B4" => " ", "B5" => "O",
      "C1" => " ",  "C2" => " ",  "C3" => " ", "C4" => " ", "C5" => "X",
      "D1" => " ",  "D2" => " ",  "D3" => " ", "D4" => " ", "D5" => "O",
      "E1" => "O",  "E2" => " ",  "E3" => " ", "E4" => " ", "E5" => " ",
    }
    actual = a.find_sides(board, 5)
    expected = {
      :top => [
        {:position => "A2",
        :piece => " "},
        {:position => "A3",
        :piece => "X"},
        {:position => "A4",
        :piece => " "},
    ],
      :bottom => [
        {:position => "E2",
        :piece => " "},
        {:position => "E3",
        :piece => " "},
        {:position => "E4",
        :piece => " "},
      ],
      :left => [
        {:position => "B1",
        :piece => " "},
        {:position => "C1",
        :piece => " "},
        {:position => "D1",
        :piece => " "},
      ],
      :right => [
        {:position => "B5",
        :piece => "O"},
        {:position => "C5",
        :piece => "X"},
        {:position => "D5",
        :piece => "O"},
      ]
    }
    assert_equal(expected, actual)
  end
  def test_find_sides_7x7
    a = UnbeatableAI.new
    board = {
      "A1" => " ",  "A2" => " ",  "A3" => "X", "A4" => " ", "A5" => " ", "A6" => " ", "A7" => "X",
      "B1" => " ",  "B2" => "X",  "B3" => "O", "B4" => " ", "B5" => " ", "B6" => " ", "B7" => "X",
      "C1" => " ",  "C2" => " ",  "C3" => " ", "C4" => "O", "C5" => " ", "C6" => " ", "C7" => "X",
      "D1" => " ",  "D2" => " ",  "D3" => " ", "D4" => "O", "D5" => " ", "D6" => " ", "D7" => "X",
      "E1" => " ",  "E2" => " ",  "E3" => " ", "E4" => " ", "E5" => " ", "E6" => " ", "E7" => "X",
      "F1" => " ",  "F2" => " ",  "F3" => " ", "F4" => " ", "F5" => " ", "F6" => " ", "F7" => "X",
      "G1" => "O",  "G2" => " ",  "G3" => "X", "G4" => "O", "G5" => "X", "G6" => " ", "G7" => "X",
    }
    actual = a.find_sides(board, 7)
    expected = {
      :top => [
        {:position => "A2",
        :piece => " "},
        {:position => "A3",
        :piece => "X"},
        {:position => "A4",
        :piece => " "},
        {:position => "A5",
        :piece => " "},
        {:position => "A6",
        :piece => " "},
    ],
      :bottom => [
        {:position => "G2",
        :piece => " "},
        {:position => "G3",
        :piece => "X"},
        {:position => "G4",
        :piece => "O"},
        {:position => "G5",
        :piece => "X"},
        {:position => "G6",
        :piece => " "},
      ],
      :left => [
        {:position => "B1",
        :piece => " "},
        {:position => "C1",
        :piece => " "},
        {:position => "D1",
        :piece => " "},
        {:position => "E1",
        :piece => " "},
        {:position => "F1",
        :piece => " "},
      ],
      :right => [
        {:position => "B7",
        :piece => "X"},
        {:position => "C7",
        :piece => "X"},
        {:position => "D7",
        :piece => "X"},
        {:position => "E7",
        :piece => "X"},
        {:position => "F7",
        :piece => "X"},
      ]
    }
    assert_equal(expected, actual)
  end

  def test_fork_triangle_1
    game = Game.new
    # game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "A3")
    game.make_move("O", "B1")
    game.make_move("O", "A2")
    move = UnbeatableAI.new.make_move(game.return_board, "X")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => "X",
      "B1" => "O",  "B2" => "X",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_fork_triangle_2
    game = Game.new
    game.alt_player
    game.make_move("X", "A2")
    game.make_move("X", "B1")
    game.make_move("O", "C1")
    game.make_move("O", "A1")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => "X",  "A3" => " ",
      "B1" => "X",  "B2" => "O",  "B3" => " ",
      "C1" => "O",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_fork_arrowhead_1
    game = Game.new
    game.alt_player
    game.make_move("X", "A2")
    game.make_move("X", "B2")
    game.make_move("O", "C2")
    game.make_move("O", "B3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => "X",  "A3" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => "O",
      "C1" => " ",  "C2" => "O",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_fork_arrowhead_2
    game = Game.new
    game.alt_player
    game.make_move("X", "B2")
    game.make_move("X", "B3")
    game.make_move("O", "B1")
    game.make_move("O", "A2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => "O",  "A3" => " ",
      "B1" => "O",  "B2" => "X",  "B3" => "X",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_fork_encirclement_1
    game = Game.new
    game.alt_player
    game.make_move("X", "C1")
    game.make_move("X", "B2")
    game.make_move("O", "C3")
    game.make_move("O", "A1")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => " ",  "A3" => "O",
      "B1" => " ",  "B2" => "X",  "B3" => " ",
      "C1" => "X",  "C2" => " ",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_fork_encirclement_2
    game = Game.new
    game.alt_player
    game.make_move("X", "B2")
    # game.make_move("X", "B1")
    game.make_move("O", "A1")
    game.make_move("O", "C3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => " ",
      "C1" => "O",  "C2" => " ",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_fork_triangle_block_1
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("X", "A3")
    game.make_move("O", "B1")
    game.make_move("O", "A2")
    move = UnbeatableAI.new.make_move(game.return_board, "X")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => "X",
      "B1" => "O",  "B2" => "O",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_fork_triangle_block_2
    game = Game.new
    # game.alt_player
    game.make_move("X", "A2")
    game.make_move("X", "B1")
    game.make_move("O", "C1")
    game.make_move("O", "A1")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => "X",  "A3" => " ",
      "B1" => "X",  "B2" => "X",  "B3" => " ",
      "C1" => "O",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_fork_arrowhead_block_1
    game = Game.new
    # game.alt_player
    game.make_move("X", "A2")
    game.make_move("X", "B2")
    game.make_move("O", "C2")
    game.make_move("O", "B3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => "X",  "A3" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => "O",
      "C1" => " ",  "C2" => "O",  "C3" => "X"
    }
    assert_equal(expected, actual)
  end
  def test_fork_arrowhead_block_2
    game = Game.new
    # game.alt_player
    game.make_move("X", "B2")
    game.make_move("X", "B3")
    game.make_move("O", "B1")
    game.make_move("O", "A2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => " ",
      "B1" => "O",  "B2" => "X",  "B3" => "X",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_fork_encirclement_block_1
    game = Game.new
    # game.alt_player
    game.make_move("X", "C1")
    game.make_move("X", "B2")
    game.make_move("O", "C3")
    game.make_move("O", "A1")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => " ",  "A3" => "X",
      "B1" => " ",  "B2" => "X",  "B3" => " ",
      "C1" => "X",  "C2" => " ",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_fork_encirclement_block_2
    game = Game.new
    # game.alt_player
    game.make_move("X", "B2")
    # game.make_move("X", "B1")
    game.make_move("O", "A1")
    game.make_move("O", "C3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => " ",
      "C1" => "X",  "C2" => " ",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end

  def test_take_center_1
    game = Game.new
    # # game.alt_player
    # game.make_move("X", "B2")
    # # game.make_move("X", "B1")
    # game.make_move("O", "A1")
    # game.make_move("O", "C3")
    move = UnbeatableAI.new.make_move(game.return_board, "X")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "X",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)

  end
  def test_take_center_2
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_take_opposite_corner_1
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_take_opposite_corner_2
    game = Game.new
    game.alt_player
    game.make_move("X", "A3")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => "X",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => "O",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_take_opposite_corner_3
    game = Game.new
    game.alt_player
    game.make_move("X", "C3")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => "X"
    }
    assert_equal(expected, actual)
  end
  def test_take_opposite_corner_2
    game = Game.new
    game.alt_player
    game.make_move("X", "C1")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => " ",  "A2" => " ",  "A3" => "O",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => "X",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_take_empty_corner_1
    game = Game.new
    game.alt_player
    # game.make_move("X", "C1")
    game.make_move("O", "B2")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "O",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => "O",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
    assert_equal(expected, actual)
  end
  def test_take_empty_corner_2
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("O", "A2")
    game.make_move("X", "B2")
    game.make_move("O", "C3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => "O",
      "B1" => " ",  "B2" => "X",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_take_empty_side_1
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("O", "A2")
    game.make_move("X", "A3")
    game.make_move("X", "B2")
    game.make_move("O", "B1")
    game.make_move("X", "C1")
    game.make_move("O", "C3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => "X",
      "B1" => "O",  "B2" => "X",  "B3" => " ",
      "C1" => "X",  "C2" => "O",  "C3" => "O"
    }
    assert_equal(expected, actual)
  end
  def test_take_empty_side_2
    game = Game.new
    game.alt_player
    game.make_move("X", "A1")
    game.make_move("O", "A2")
    game.make_move("O", "A3")
    game.make_move("O", "B1")
    game.make_move("X", "B2")
    game.make_move("X", "C1")
    game.make_move("X", "C2")
    game.make_move("X", "C3")
    move = UnbeatableAI.new.make_move(game.return_board, "O")
    game.make_move(move)
    actual = game.return_board
    expected = {
      "A1" => "X",  "A2" => "O",  "A3" => "O",
      "B1" => "O",  "B2" => "X",  "B3" => "O",
      "C1" => "X",  "C2" => "X",  "C3" => "X"
    }
    assert_equal(expected, actual)
  end
=begin
  def test_rand_vs_unbeat_rand_first
    unbeatable_wins = 0
    random_wins = 0
    100000.times do
      game = Game.new
      turn = 1
      complete = false

      until complete == true
        if turn % 2 == 0
          move = UnbeatableAI.new.make_move(game.return_board, "O")
          game.make_move(move)
        else
          game.make_move(RandomAI.new.choose_position, "X")
        end
        turn += 1
        win = game.check_win
        draw = game.check_draw
        if win == true || draw == true
          if win == true && game.return_current_player == "X"
            random_wins += 1
          elsif win == true && game.return_current_player == "O"
            unbeatable_wins += 1
          end

          complete = true
        end
        game.alt_player
      end
    end
    puts "random wins is: #{random_wins}"
    puts "unbeatable_wins is: #{unbeatable_wins}"
    assert_equal(0, random_wins)
  end
  def test_rand_vs_unbeat_unbeat_first
    unbeatable_wins = 0
    random_wins = 0
    100000.times do
      game = Game.new
      turn = 1
      complete = false

      until complete == true
        if turn % 2 == 0
          game.make_move(RandomAI.new.choose_position, "O")
        else
          move = UnbeatableAI.new.make_move(game.return_board, "X")
          game.make_move(move)
        end
        turn += 1
        win = game.check_win
        draw = game.check_draw
        if win == true || draw == true
          if win == true && game.return_current_player == "O"
            random_wins += 1
          elsif win == true && game.return_current_player == "X"
            unbeatable_wins += 1
          end

          complete = true
        end
        game.alt_player
      end
    end
    puts "random wins is: #{random_wins}"
    puts "unbeatable_wins is: #{unbeatable_wins}"
    assert_equal(0, random_wins)
  end
  def test_unbeat_vs_unbeat
    p1wins = 0
    p2wins = 0
    100000.times do
      game = Game.new
      turn = 1
      complete = false

      until complete == true
        if turn % 2 == 0
          move = UnbeatableAI.new.make_move(game.return_board, "O")
          game.make_move(move)
        else
          move = UnbeatableAI.new.make_move(game.return_board, "X")
          game.make_move(move)
        end
        turn += 1
        win = game.check_win
        draw = game.check_draw
        if win == true || draw == true
          if win == true && game.return_current_player == "O"
            p2wins += 1
          elsif win == true && game.return_current_player == "X"
            p1wins += 1
          end

          complete = true
        end
        game.alt_player
      end
    end
    puts "p2wins is: #{p2wins}"
    puts "p1wins is: #{p1wins}"
    assert_equal(0, p1wins + p2wins)
  end
=end
  def test_board_expandable_size_5x5
    expected = {
      "A1" => " ", "A2" => " ", "A3" => " ", "A4" => " ", "A5" => " ",
      "B1" => " ", "B2" => " ", "B3" => " ", "B4" => " ", "B5" => " ",
      "C1" => " ", "C2" => " ", "C3" => " ", "C4" => " ", "C5" => " ",
      "D1" => " ", "D2" => " ", "D3" => " ", "D4" => " ", "D5" => " ",
      "E1" => " ", "E2" => " ", "E3" => " ", "E4" => " ", "E5" => " ",
    }
    actual = Board.new(5).return_board
    assert_equal(expected, actual)
  end
  
  def test_board_expandable_size_7x7
    expected = {
      "A1" => " ", "A2" => " ", "A3" => " ", "A4" => " ", "A5" => " ", "A6" => " ", "A7" => " ",
      "B1" => " ", "B2" => " ", "B3" => " ", "B4" => " ", "B5" => " ", "B6" => " ", "B7" => " ",
      "C1" => " ", "C2" => " ", "C3" => " ", "C4" => " ", "C5" => " ", "C6" => " ", "C7" => " ",
      "D1" => " ", "D2" => " ", "D3" => " ", "D4" => " ", "D5" => " ", "D6" => " ", "D7" => " ",
      "E1" => " ", "E2" => " ", "E3" => " ", "E4" => " ", "E5" => " ", "E6" => " ", "E7" => " ",
      "F1" => " ", "F2" => " ", "F3" => " ", "F4" => " ", "F5" => " ", "F6" => " ", "F7" => " ",
      "G1" => " ", "G2" => " ", "G3" => " ", "G4" => " ", "G5" => " ", "G6" => " ", "G7" => " ",
    }
    actual = Board.new(7).return_board
    assert_equal(expected, actual)
  end
  
  
    def test_horizontal_expandable_win_a
      b = Board.new(5)
      b.make_move("X", "A1")
      b.make_move("X", "A2")
      b.make_move("X", "A3")
      b.make_move("X", "A4")
      b.make_move("X", "A5")
      b.check_win
      actual = b.check_win
      expected = true
      assert_equal(expected, actual)
    end
    def test_horizontal_expandable_win_b
      b = Board.new(7)
      b.make_move("O", "B1")
      b.make_move("O", "B2")
      b.make_move("O", "B3")
      b.make_move("O", "B4")
      b.make_move("O", "B5")
      b.make_move("O", "B6")
      b.make_move("O", "B7")
      b.check_win
      actual = b.check_win
      expected = true
      assert_equal(expected, actual)
    end
    def test_horizontal_expandable_win_c
      b = Board.new
      b.make_move("X", "C1")
      b.make_move("X", "C2")
      b.make_move("X", "C3")
      b.make_move("X", "C4")
      b.make_move("X", "C5")
      b.check_win
      actual = b.check_win
      expected = true
      assert_equal(expected, actual)
    end
    def test_horizontal_expandable_fail_a
      b = Board.new(5)
      b.make_move("X", "A1")
      b.make_move("X", "A2")
      b.make_move("X", "A3")
      b.make_move("X", "A4")
      b.make_move(" ", "A5")
      b.check_win
      actual = b.check_win
      expected = false
      assert_equal(expected, actual)
    end
    def test_horizontal_expandable_fail_b
      b = Board.new(7)
      b.make_move("O", "B1")
      b.make_move("X", "B2")
      b.make_move("O", "B3")
      b.make_move("O", "B4")
      b.make_move("O", "B5")
      b.make_move("O", "B6")
      b.make_move("O", "B7")
      b.check_win
      actual = b.check_win
      expected = false
      assert_equal(expected, actual)
    end
    def test_horizontal_expandable_fail_c
      b = Board.new
      b.make_move("X", "C1")
      b.make_move("O", "C2")
      b.make_move("X", "C3")
      b.make_move("X", "C4")
      b.make_move("X", "C5")
      b.check_win
      actual = b.check_win
      expected = false
      assert_equal(expected, actual)
    end
    def test_vertical_expandable_win_1
      b = Board.new(5)
      b.make_move("X", "A1")
      b.make_move("X", "B1")
      b.make_move("X", "C1")
      b.make_move("X", "D1")
      b.make_move("X", "E1")
      b.check_win
      actual = b.check_win
      expected = true
      assert_equal(expected, actual)
    end
    def test_vertical_expandable_win_2
      b = Board.new(5)
      b.make_move("O", "A2")
      b.make_move("O", "B2")
      b.make_move("O", "C2")
      b.make_move("O", "D2")
      b.make_move("O", "E2")
      b.check_win
      actual = b.check_win
      expected = true
      assert_equal(expected, actual)
    end
    def test_vertical_expandable_win_3
      b = Board.new(7)
      b.make_move("X", "A3")
      b.make_move("X", "B3")
      b.make_move("X", "C3")
      b.make_move("X", "D3")
      b.make_move("X", "E3")
      b.make_move("X", "F3")
      b.make_move("X", "G3")
      b.check_win
      actual = b.check_win
      expected = true
      assert_equal(expected, actual)
    end
    def test_vertical_expandable_fail_1
      b = Board.new(5)
      b.make_move("X", "A1")
      b.make_move(" ", "B1")
      b.make_move("X", "C1")
      b.make_move("X", "D1")
      b.make_move("X", "E1")
      b.check_win
      actual = b.check_win
      expected = false
      assert_equal(expected, actual)
    end
    def test_vertical_expandable_fail_2
      b = Board.new(5)
      b.make_move("X", "A2")
      b.make_move("O", "B2")
      b.make_move("O", "C2")
      b.make_move("O", "D2")
      b.make_move("O", "E2")
      b.check_win
      actual = b.check_win
      expected = false
      assert_equal(expected, actual)
    end
    def test_vertical_expandable_fail_3
      b = Board.new(7)
      b.make_move("X", "A3")
      b.make_move("X", "B3")
      b.make_move("X", "C3")
      b.make_move("X", "D3")
      b.make_move("O", "E3")
      b.make_move("X", "F3")
      b.make_move("X", "G3")
      b.check_win
      actual = b.check_win
      expected = false
      assert_equal(expected, actual)
    end
    def test_diagonal_expandable_win_1
      b = Board.new(5)
      b.make_move("X", "A1")
      b.make_move("X", "B2")
      b.make_move("X", "C3")
      b.make_move("X", "D4")
      b.make_move("X", "E5")
      b.check_win
      actual = b.check_win
      expected = true
      assert_equal(expected, actual)
    end
    def test_diagonal_expandable_win_2
      b = Board.new(7)
      b.make_move("O", "A1")
      b.make_move("O", "B2")
      b.make_move("O", "C3")
      b.make_move("O", "D4")
      b.make_move("O", "E5")
      b.make_move("O", "F6")
      b.make_move("O", "G7")
      b.check_win
      actual = b.check_win
      expected = true
      assert_equal(expected, actual)
    end
    def test_diagonal_expandable_fail_1
      b = Board.new(5)
      b.make_move("X", "A1")
      b.make_move("O", "B2")
      b.make_move("X", "C3")
      b.make_move("O", "D4")
      b.make_move("X", "E5")
      b.check_win
      actual = b.check_win
      expected = false
      assert_equal(expected, actual)
    end
    def test_diagonal_expandable_fail_2
      b = Board.new(7)
      b.make_move("X", "A1")
      b.make_move("O", "B2")
      b.make_move("X", "C3")
      b.make_move("O", "D4")
      b.make_move("X", "E5")
      b.make_move("O", "F6")
      b.make_move("X", "G7")
      b.check_win
      actual = b.check_win
      expected = false
      assert_equal(expected, actual)
    end
    def test_draw_epandable_1
      b = Board.new(5)
      b.make_move("X", "A1")
      b.make_move("O", "A2")
      b.make_move("X", "A3")
      b.make_move("O", "A4")
      b.make_move("X", "A5")
      b.make_move("X", "B1")
      b.make_move("O", "B2")
      b.make_move("X", "B3")
      b.make_move("O", "B4")
      b.make_move("X", "B5")
      b.make_move("O", "C1")
      b.make_move("X", "C2")
      b.make_move("O", "C3")
      b.make_move("X", "C4")
      b.make_move("O", "C5")
      b.make_move("X", "D1")
      b.make_move("O", "D2")
      b.make_move("X", "D3")
      b.make_move("O", "D4")
      b.make_move("O", "D5")
      b.make_move("O", "E1")
      b.make_move("X", "E2")
      b.make_move("O", "E3")
      b.make_move("X", "E4")
      b.make_move("O", "E5")
      
      actual = b.check_draw
      
      expected = true
      assert_equal(expected, actual)
    end
    
    def test_return_empty_spaces_1
      b = Board.new
      expected = ["A1", "B1", "C1", "A2", "B2", "C2", "A3", "B3", "C3"]
      actual = b.return_empty_spaces
      assert_equal(expected, actual)
    end  
    def test_return_empty_spaces_2
      b = Board.new(5)
      expected = ["A1", "B1", "C1", "D1", "E1", "A2", "B2", "C2", "D2", "E2", "A3", "B3", "C3", "D3", "E3", "A4", "B4", "C4", "D4", "E4", "A5", "B5", "C5", "D5", "E5"]
      actual = b.return_empty_spaces
      assert_equal(expected, actual)
    end  
    def test_return_empty_spaces_3
      b = Board.new
      b.make_move("X", "A1")
      b.make_move("O", "B2")
      b.make_move("X", "B1")
      expected = ["C1", "A2", "C2", "A3", "B3", "C3"]
      actual = b.return_empty_spaces
      assert_equal(expected, actual)
    end  
    def test_return_empty_spaces_4
      b = Board.new
      b.make_move("X", "A1")
      b.make_move("O", "B2")
      b.make_move("X", "B1")
      b.make_move("O", "C1")
      b.make_move("X", "A3")
      b.make_move("O", "A2")
      expected = ["C2", "B3", "C3"]
      actual = b.return_empty_spaces
      assert_equal(expected, actual)
    end  
    
    def test_rand_ai_expandable1
      b = Board.new(5)
      rand = RandomAI.new
      b.make_move("X", "A1")
      b.make_move("X", "A2")
      b.make_move("X", "A3")
      b.make_move("X", "B1")
      b.make_move("X", "B2")
      b.make_move("X", "B3")
      b.make_move("X", "C1")
      b.make_move("X", "C2")
      b.make_move("X", "C3")
      expected = {
        "A1" => "X", "A2" => "X", "A3" => "X", "A4" => " ", "A5" => " ",
        "B1" => "X", "B2" => "X", "B3" => "X", "B4" => " ", "B5" => " ",
        "C1" => "X", "C2" => "X", "C3" => "X", "C4" => " ", "C5" => " ",
        "D1" => " ", "D2" => " ", "D3" => " ", "D4" => " ", "D5" => " ",
        "E1" => " ", "E2" => " ", "E3" => " ", "E4" => " ", "E5" => " ",
      }
      actual = rand.make_move(b, "O")
      refute_equal(expected, actual)
    end
    def test_seqai_expandable1
      game = Game.new(5)
      game.make_move("X", "A1")
      SequentialAI.new.make_move(game, "O")
      game.make_move("X", "A3")
      SequentialAI.new.make_move(game, "O")
      game.make_move("X", "C3")
      SequentialAI.new.make_move(game, "O")
      game.make_move("X", "B2")
      SequentialAI.new.make_move(game, "O")
      actual = game.return_board
      expected = {
        "A1" => "X", "A2" => " ", "A3" => "X", "A4" => " ", "A5" => " ",
        "B1" => "O", "B2" => "X", "B3" => " ", "B4" => " ", "B5" => " ",
        "C1" => "O", "C2" => " ", "C3" => "X", "C4" => " ", "C5" => " ",
        "D1" => "O", "D2" => " ", "D3" => " ", "D4" => " ", "D5" => " ",
        "E1" => "O", "E2" => " ", "E3" => " ", "E4" => " ", "E5" => " ",
      }
      assert_equal(expected, actual)
    end
    def test_unbeatable_poison_1
      game = Game.new(5)
      game.make_move("X", "A1")
      game.make_move("O", "C3")
      game.make_move("X", "E1")
      game.make_move("O", "E5")
      game.make_move("X", "C1")
      game.alt_player
      move = UnbeatableAI.new.make_move(game.return_board, "O", 5)
      game.make_move(move)
      actual = game.return_board
      expected = {
        "A1" => "X", "A2" => " ", "A3" => " ", "A4" => " ", "A5" => " ",
        "B1" => "O", "B2" => " ", "B3" => " ", "B4" => " ", "B5" => " ",
        "C1" => "X", "C2" => " ", "C3" => "O", "C4" => " ", "C5" => " ",
        "D1" => " ", "D2" => " ", "D3" => " ", "D4" => " ", "D5" => " ",
        "E1" => "X", "E2" => " ", "E3" => " ", "E4" => " ", "E5" => "O",
      }
      assert_equal(expected, actual)
    end
    def test_unbeatable_poison_2
      game = Game.new(5)
      game.make_move("X", "A1")
      game.make_move("X", "C3")
      game.make_move("X", "E5")
      game.alt_player
      move = UnbeatableAI.new.make_move(game.return_board, "O", 5)
      game.make_move(move)
      actual = game.return_board
      expected = {
        "A1" => "X", "A2" => " ", "A3" => " ", "A4" => " ", "A5" => " ",
        "B1" => " ", "B2" => "O", "B3" => " ", "B4" => " ", "B5" => " ",
        "C1" => " ", "C2" => " ", "C3" => "X", "C4" => " ", "C5" => " ",
        "D1" => " ", "D2" => " ", "D3" => " ", "D4" => " ", "D5" => " ",
        "E1" => " ", "E2" => " ", "E3" => " ", "E4" => " ", "E5" => "X",
      }
      assert_equal(expected, actual)
    end
    def test_unbeatable_poison_3
      game = Game.new(5)
      game.make_move("X", "C1")
      game.make_move("X", "C3")
      game.make_move("X", "C5")
      game.alt_player
      move = UnbeatableAI.new.make_move(game.return_board, "O", 5)
      game.make_move(move)
      actual = game.return_board
      expected = {
        "A1" => " ", "A2" => " ", "A3" => " ", "A4" => " ", "A5" => " ",
        "B1" => " ", "B2" => " ", "B3" => " ", "B4" => " ", "B5" => " ",
        "C1" => "X", "C2" => "O", "C3" => "X", "C4" => " ", "C5" => "X",
        "D1" => " ", "D2" => " ", "D3" => " ", "D4" => " ", "D5" => " ",
        "E1" => " ", "E2" => " ", "E3" => " ", "E4" => " ", "E5" => " ",
      }
      assert_equal(expected, actual)
    end
    
end
