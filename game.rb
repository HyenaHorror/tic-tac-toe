require_relative 'board.rb'
require_relative 'random_ai.rb'
require_relative 'player.rb'

class Game
  def initialize
    @board = Board.new
    set_player("X")
    @player1 = Player.new
    @player2 = Player.new(2, "O")
  end

  def set_player(params)
    @current_player = params.to_s.upcase
  end

  def alt_player
    if @current_player == "X"
      @current_player = "O"
    else
      @current_player = "X"
    end
  end

  def make_move(player=@current_player, position)
    @board.make_move(player, position)
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
end
