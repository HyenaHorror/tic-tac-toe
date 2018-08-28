class UnbeatableAI
  def make_move(board, player_piece)
    columns = ["A", "B", "C"]
    rows = ["1", "2", "3"]

    # win
    # if self has two in a row, take third to win
    #horizontal
    columns.each do |c|
      check = Array.new
      position = Array.new
      rows.each do |r|
        check << board["#{c}#{r}"]
        position << "#{c}#{r}"
      end
      # puts "check row #{c}: #{check}"
      # puts "win? #{check.count(player_piece) == 2}"
      winning_position = position[check.index(" ")]

      win = check.count(player_piece) == 2
      if win == true
        return winning_position
      end
    end

    # block
    # If opponent has two in a row block their win

    # fork
    # create an opportunity where self has two
    # opportunities to win

    # block opponents fork
    #

    # center
    # take center

    # opposite corner
    #

    # empty corner
    #

    # empty side
    #

    # board.make_move(move)
  end
end