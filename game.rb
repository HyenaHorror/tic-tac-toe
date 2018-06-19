require_relative 'board.rb'
require_relative 'random_ai.rb'

class Game
  def initialize
    @board = Board.new
    set_player("X")
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
end
