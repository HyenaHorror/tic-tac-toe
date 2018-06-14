class Board
  # position_list = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]

  def initialize
    @current_state = {
      "A1" => " ",  "A2" => " ",  "A3" => " ",
      "B1" => " ",  "B2" => " ",  "B3" => " ",
      "C1" => " ",  "C2" => " ",  "C3" => " "
    }
  end

  def return_board
    return @current_state
  end

  def return_position(pos)
    return @current_state[pos]
  end

  def make_move(player, position)
    if @current_state[position] == " "
      @current_state[position] = player.to_s.upcase
    else
      return "Invalid move!"
    end
  end

  def check_win
    columns = ["A", "B", "C"]
    rows = ["1", "2", "3"]
    win = false
    #horizontal
    columns.each do |c|
      if @current_state["#{c}1"] == @current_state["#{c}2"] && @current_state["#{c}3"] == @current_state["#{c}1"] && @current_state["#{c}1"] != " "
        win = true
        return win
      end
    end
    #vertical
    rows.each do |r|
      if @current_state["A#{r}"] == @current_state["B#{r}"] && @current_state["C#{r}"] == @current_state["A#{r}"] && @current_state["A#{r}"] != " "
        win = true
        return win
      end
    end
    #diagonal
    if @current_state["A1"] == @current_state["B2"] && @current_state["C3"] == @current_state["A1"] && @current_state["A1"] != " "
      win = true
    elsif @current_state["A3"] == @current_state["B2"] && @current_state["C1"] == @current_state["A3"] && @current_state["A3"] != " "
      win = true
    end
    return win
  end

  def check_draw
    available_positions = 9

    @current_state.each do |pos, value|
      if value != " "
        available_positions -= 1
      end
    end
    available_positions == 0
  end
end
