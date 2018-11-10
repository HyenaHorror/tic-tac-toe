class Board
  # position_list = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]

  def initialize(size=3)
    @columns = ("A"..("A".ord + (size-1)).chr).to_a
    @rows = (1..size).to_a
    @current_state = Hash.new
    @size = size
    
    @rows.each do |r|
      @columns.each do |c|
        @current_state["#{c}#{r}"] = " "
      end
    end
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
    # columns = ["A", "B", "C"]
    # rows = ["1", "2", "3"]
    win = false
    # puts "in check win"
    # puts @current_state
    #horizontal
    @columns.each do |c|
      row_to_check = Array.new
      counter = 0
      @size.times do
        counter += 1
        row_to_check << @current_state["#{c}#{counter}"]
      end
      
      # if all spaces are the same symbol (except empty) return win
      if row_to_check.uniq.length == 1
        unless row_to_check.uniq[0] == " "
          return true
        end
      end
    end
    #vertical
    @rows.each do |r|
      column_to_check = Array.new
      column = "@"
      @size.times do
        column.next!
        column_to_check << @current_state["#{column}#{r}"]
      end
      
      # if all spaces are the same symbol (except empty) return win
      if column_to_check.uniq.length == 1
        unless column_to_check.uniq[0] == " "
          return true
        end
      end
    end
    #diagonal
    @columns.each do |c|
      forward_diagonal_to_check = Array.new
      backward_diagonal_to_check = Array.new
      row = 0
      column = "@"
      @size.times do
        row += 1
        column.next!
        forward_diagonal_to_check << @current_state["#{column}#{row}"]
      end
      row = @size.clone
      column = "@"
      @size.times do
        column.next!
        backward_diagonal_to_check << @current_state["#{column}#{row}"]
        row -= 1
      end
      
      if forward_diagonal_to_check.uniq.length == 1
        unless forward_diagonal_to_check.uniq[0] == " "
          return true
        end
      end
      
      if backward_diagonal_to_check.uniq.length == 1
        unless backward_diagonal_to_check.uniq[0] == " "
          return true
        end
      end
      return win
    end
      
    
    # 
    # if @current_state["A1"] == @current_state["B2"] && @current_state["C3"] == @current_state["A1"] && @current_state["A1"] != " "
    #   win = true
    # elsif @current_state["A3"] == @current_state["B2"] && @current_state["C1"] == @current_state["A3"] && @current_state["A3"] != " "
    #   win = true
    # end
    # return win
  end

  def check_draw
    available_positions = @size * @size

    @current_state.each do |pos, value|
      if value != " "
        available_positions -= 1
      end
    end
    available_positions == 0
  end

  def build(size)
    result = Hash.new
    c = "@"
    r = "0"
    columns = Array.new
    rows = Array.new
    size.times do
      columns << c.next!.dup
      rows << r.next!.dup
    end
    columns.each do |c|
      rows.each do |r|
        result.merge!({"#{c}#{r}" => " "})
      end
    end
    return result
  end
end
