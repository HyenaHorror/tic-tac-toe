class Board
  # position_list = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]

  def initialize
    @current_state = {
      "A1" => "",  "A2" => "",  "A3" => "",
      "B1" => "",  "B2" => "",  "B3" => "",
      "C1" => "",  "C2" => "",  "C3" => ""
    }
    # puts @current_state
    # return @current_state
  end

  def return_board
    return @current_state
  end

  def return_position(pos)
    return @current_state[pos]
  end

  def make_move(player, position)
    if @current_state[position] == ""
      @current_state[position] = player.to_s.upcase
    else
      return "Invalid move!"
    end
  end
end
