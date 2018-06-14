class Board
  # position_list = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]

  def initialize
    puts "board initialized"
    @current_state = {
      :A1 => "",  :A2 => "",  :A3 => "",
      :B1 => "",  :B2 => "",  :B3 => "",
      :C1 => "",  :C2 => "",  :C3 => ""
    }
    # puts @current_state
    # return @current_state
  end
  def return_board
    return @current_state
  end
end
