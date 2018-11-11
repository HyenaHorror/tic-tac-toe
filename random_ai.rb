class RandomAI
  def choose_position
    columns = ["A", "B", "C"]
    rows = ["1", "2", "3"]
    return "#{columns.sample}#{rows.sample}"
  end

  def make_move(board, player_piece)
    positions = board.return_empty_spaces.shuffle!
    valid = "Invalid move!"

    until valid != "Invalid move!"
      selection = positions.pop
      valid = board.make_move(player_piece, "#{selection}")
    end
  end
end
