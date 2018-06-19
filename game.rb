require_relative 'board.rb'
require_relative 'random_ai.rb'

class Game
  def initialize
    @board = Board.new
    set_player("X")
  end

  def set_player(params)
    @current_player = params.to_s.upcase
    # return @current_player
  end

end
