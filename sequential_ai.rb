class SequentialAI
  def make_move(board, player_piece)
    valid = "Invalid move!"
    positions = board.return_empty_spaces
    
    until valid != "Invalid move!"
      selection = positions.shift
      valid = board.make_move(player_piece, "#{selection}")
    end
  end
end
