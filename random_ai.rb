class RandomAI
  def choose_position
    columns = ["A", "B", "C"]
    rows = ["1", "2", "3"]
    return "#{columns.sample}#{rows.sample}"
  end

  def make_move(board, player_piece)
    columns = ("A".."C").to_a
    rows = (1..3).to_a
    valid = "Invalid move!"

    until valid != "Invalid move!"
      valid = board.make_move(player_piece, "#{columns.sample}#{rows.sample}")
    end
  end
end
