require_relative 'board.rb'
require_relative 'random_ai.rb'
require_relative 'sequential_ai.rb'
require_relative 'player.rb'

class Game
  def initialize
    @board = Board.new
    set_player("X")
    @player1 = Player.new
    @player2 = Player.new(2, "O")

    @size = 3
    @turn = 1
    @total_moves = 0
  end

  def set_player(params)
    @current_player = params.to_s.upcase
  end

  def return_current_player
    return @current_player.to_s
  end

  def alt_player
    if @current_player == "X"
      @current_player = "O"
    else
      @current_player = "X"
    end
  end

  def make_move(player=@current_player, position)
    pos = @board.return_board[position]
    if pos == " "
      @total_moves += 1
      @board.make_move(player, position)
    else
      return "Invalid move!"
    end
  end

  def return_board
    @board.return_board
  end

  def return_players
    return [@player1.return, @player2.return]
  end

  def set_player_type(num, type)
    a = [@player1, @player2]
    b = a[num - 1]
    b.set_type(type)
    return b.return
  end

  def human_input(pos)
    self.make_move(pos)

    if @turn == 1
      @turn = 2
    else
      @turn = 1
    end
  end

  def get_next_move
    if @turn == 1
      check_move_type(@player1)
      @turn = 2
    else
      check_move_type(@player2)
      @turn = 1
    end
  end

  def check_move_type(player)
    # puts "check move type player : #{player.return}"
    type = player.return[:type]
    symbol = player.return[:symbol]
    if type == "HUMAN"
      return type
    elsif type == "RANDOM"
      RandomAI.new.make_move(@board, symbol)
      alt_player
    elsif type == "SEQUENTIAL"
      SequentialAI.new.make_move(@board, symbol)
      alt_player

    end
  end

  def check_win
    return @board.check_win
  end
  def check_draw
    @total_moves == @size * @size
  end
end
