class SequentialAI
  def make_move(board, player_piece)
    columns = ("A".."C").to_a
    rows = (1..3).to_a
    valid = "Invalid move!"

    until valid != "Invalid move!"
      valid = board.make_move(player_piece, "#{columns[0]}#{rows[0]}")
      if rows.length == 0
        rows = (1..3).to_a
        columns.shift
      else
        rows.shift
      end
    end
  end
end
