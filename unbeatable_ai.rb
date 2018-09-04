class UnbeatableAI
  def make_move(board, player_piece)
    size = 3
    players = ["X", "O"]
    players.delete(player_piece)
    opponent = players[0]
    arrays_to_analyze = Array.new

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
    #block
    # use with with enemy piece
    #horizontal
    columns.each do |c|
      check = Array.new
      position = Array.new
      rows.each do |r|
        check << board["#{c}#{r}"]
        position << "#{c}#{r}"
      end
        arrays_to_analyze << {:check => check, :position => position}
    end
    #vertical
    rows.each do |r|
      check = Array.new
      position = Array.new
      columns.each do |c|
        check << board["#{c}#{r}"]
        position << "#{c}#{r}"
    end
    arrays_to_analyze << {:check => check, :position => position}
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
    arrays_to_analyze << {:check => forward, :position => position}
    position = Array.new
    rows.reverse.each do |r|
      c = columns2.shift
      backward << board["#{c}#{r}"]
      position << "#{c}#{r}"
    end
    arrays_to_analyze << {:check => backward, :position => position}

  win = false
  block = false

    arrays_to_analyze.each do |array|
      position = array[:position]
      check = array[:check]
      win_pos = position[check.index(" ").to_i]
      pos = check.index(" ")

      win = check.count(player_piece) == size - 1
      if win == true
        return win_pos
      end
    end

    arrays_to_analyze.each do |array|
      position = array[:position]
      check = array[:check]
      block_pos = position[check.index(" ").to_i]
      pos = check.index(" ")

      block = check.count(opponent) == size - 1 && check.count(" ") == 1
      if block == true
        return block_pos
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

  def find_corners(board, size=3)
    result = Array.new
    c = "@"
    r = 1
    col = Array.new
    row = Array.new
    size.times do
      col << c.next!.dup
      row << r
      r += 1
    end

    top_left = "#{col[0]}#{row[0]}"
    top_right = "#{col[0]}#{row[-1]}"
    bottom_left = "#{col[-1]}#{row[0]}"
    bottom_right = "#{col[-1]}#{row[-1]}"

    result = {
      :top_left => {
        :position => top_left,
        :piece => board["#{top_left}"]
      },
      :top_right => {
        :position => top_right,
        :piece => board["#{top_right}"]
      },
      :bottom_left => {
        :position => bottom_left,
        :piece => board["#{bottom_left}"]
      },
      :bottom_right => {
        :position => bottom_right,
        :piece => board["#{bottom_right}"]
      },
    }
    return result
  end

  def find_center(board, size=3)
    result = Array.new
    c = "@"
    r = 1
    col = Array.new
    row = Array.new
    size.times do
      col << c.next!.dup
      row << r
      r += 1
    end
    if size % 2 == 1
      a = (size / 2)
      pos = "#{col[a]}#{row[a]}"
      return {
        :position => pos,
        :piece => board[pos]
          }
    end
  end

  def find_sides(board, size=3)
    result = Array.new
    c = "@"
    r = 1
    col = Array.new
    row = Array.new
    size.times do
      col << c.next!.dup
      row << r
      r += 1
    end
    top = Array.new
    bottom = Array.new
    left = Array.new
    right = Array.new

    #top
    row.each do |r|
      pos = "#{col[0]}#{r}"
      top << {
        :position => pos,
        :piece => board[pos]
      }
    end
    top.shift
    top.pop

    #bottom
    row.each do |r|
      pos = "#{col[-1]}#{r}"
      bottom << {
        :position => pos,
        :piece => board[pos]
      }
    end
    bottom.shift
    bottom.pop

    #left
    col.each do |c|
      pos = "#{c}#{row[0]}"
      left << {
        :position => pos,
        :piece => board[pos]
      }
    end
    left.shift
    left.pop

    #right
    col.each do |c|
      pos = "#{c}#{row[-1]}"
      right << {
        :position => pos,
        :piece => board[pos]
      }
    end
    right.shift
    right.pop

    return {
      :top => top,
      :bottom => bottom,
      :left => left,
      :right => right
    }
  end

  def check_fork(array, piece)
    empty_count = 0
    take_pos = nil
    player_count = 0

    array.each do |x|
      if x[:piece] == " "
        empty_count += 1
        take_pos = x[:position]
      elsif x[:piece] == piece
        player_count += 1
      end
    end
    if player_count == array.length - 1 && empty_count == 1
      return take_pos
    end
  end
end

class String
  def prev #gets previous letter
    self[-1] = (self[-1].ord - 1).chr
    return self
  end
end
