class UnbeatableAI
  def make_move(board, player_piece)
    size = 3
    # expandable
    c = "@"
    r = "0"
    columns = Array.new
    rows = Array.new
    size.times do
      columns << c.next!.dup
      rows << r.next!.dup
    end

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
        pos = check.index(" ")
        winning_position = position[check.index(" ").to_i]
        win = check.count(player_piece) == 2
        if win == true
          return winning_position
        end
    end
    #vertical
    rows.each do |r|
      check = Array.new
      position = Array.new
      columns.each do |c|
        check << board["#{c}#{r}"]
        position << "#{c}#{r}"
    end
    winning_position = position[check.index(" ").to_i]

    win = check.count(player_piece) == 2
    if win == true
      return winning_position
    end

    #diagonal
    forward = Array.new
    backward = Array.new
    columns2 = columns.dup
    rows2 = rows.dup
    position = Array.new
    # forward
    columns.each do |c|
      r = rows2.shift
      forward << board["#{c}#{r}"]
      position << "#{c}#{r}"
    end

    winning_position = position[forward.index(" ").to_i]

    win = forward.count(player_piece) == 2
    if win == true
      return winning_position
    end
    position = Array.new

    rows.reverse.each do |r|
      c = columns2.shift
      backward << board["#{c}#{r}"]
      position << "#{c}#{r}"
    end
    winning_position = position[backward.index(" ").to_i]

    win = backward.count(player_piece) == 2
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

class String
  def prev #gets previous letter
    self[-1] = (self[-1].ord - 1).chr
    return self
  end
end
