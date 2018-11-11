require_relative 'random_ai.rb'

class UnbeatableAI
  def make_move(board, player_piece, size=3, board_class=nil)
    @size = size
    players = ["X", "O"]
    players.delete(player_piece)
    opponent = players[0]
    arrays_to_analyze = Array.new

    # expandable
    # c = "@"
    # r = "0"
    columns = ("A"..("A".ord + (size-1)).chr).to_a
    rows = (1..size).to_a
    # size.times do
    #   columns << c.next!.dup
    #   rows << r.next!.dup
    # end

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

      win = check.count(player_piece) == size - 1 && check.count(" ") == 1
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
    
    if size > 3
      # poison lines
      # if opponent has two or more in a row, block it
      corners = find_corners(board, @size)
      sides = find_sides(board, @size)
      center = find_center(board, @size)
      
      # if diagonal line contains 2 oppoent and no self
      # poison
      # if horizonal line contains 2 oppoent and no self
      # poison
      # if vertical line contains 2 oppoent and no self
      # poison
    else
      # fork
      # create an opportunity where self has two
      # opportunities to win
      corners = find_corners(board, @size)
      sides = find_sides(board, @size)
      center = find_center(board, @size)
      # move = fork_function(board, corners, center, sides, player_piece)
      move = fork_function3x3(board, corners, center, sides, player_piece)
      unless move == nil
        return move
      end

      # block encirclement
      corner_pairs = [
        [corners[:top_left], corners[:bottom_right]],
        [corners[:top_right], corners[:bottom_left]]
      ]

      corner_pairs.each do |c|
        if c[0][:piece] == opponent && c[1][:piece] == opponent
          sides.each do |key, side|
            # puts "side is #{side[0]}"
            unless side[0][:piece] != " "
              return side[0][:position]
            end
          end
        end
      end

      #block fork
      # block opponent's opportunities
      move = fork_function3x3(board, corners, center, sides, opponent)
      unless move == nil
        return move
      end
    end
    # center
    # take center
    if center[:piece] == " "
      return center[:position]
    end

    # opposite corner
    # when this corner is taken by opponent && opposite is not, take it
    corner_pairs = [
      [corners[:top_left], corners[:bottom_right]],
      [corners[:top_right], corners[:bottom_left]]
    ]
    corner_pairs.each do |pair|
      2.times do
        if pair[0][:piece] == opponent && pair[1][:piece] == " "
          return pair[1][:position]
        end
        pair.reverse!
      end
    end
    # empty corner
    # take empty corner
    corners.each_pair do |k, c|
      if c[:piece] == " "
        return c[:position]
      end
    end

    # empty side
    # take empty side
    sides.each_pair do |k, s|
      if s[0][:piece] == " "
        return s[0][:position]
      end
    end
    
    # random
    # if nothing else, do random
    rand = RandomAI.new
    rand.make_move(board_class, player_piece)
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

  def fork_function3x3(board, corners, center, sides, piece)
  # def fork_function(board, corners, center, sides, piece, size=3)
    size = 3
    col = ("A"..("A".ord + (size-1)).chr).to_a
    row = (1..size).to_a
    # triangle
    # if two corners are taken take center
    # if center plus one corner take other corner
    corner_pairs = [
      [corners[:top_left].clone,#top
      corners[:top_right].clone],
      [corners[:bottom_left].clone, #bottom
      corners[:bottom_right].clone],
      [corners[:top_left].clone, #left
      corners[:bottom_left].clone],
      [corners[:top_right].clone, #right
      corners[:bottom_right].clone],
    ]
    corner_pairs.each do |c|
      pos_arr = [c[0][:position], c[1][:position], center[:position]]
      check_arr = [c[0][:piece], c[1][:piece], center[:piece]]
      check = check_arr.count(piece) == 2 && check_arr.count(" ") == 1
      if check == true
        x = check_arr.index(" ")
        fork_move = pos_arr[x]
        # puts "fork move is #{fork_move }"
        return fork_move
      end

    end
    # arrowhead
    # if two sides taken take corner that intersects them
    side_pairs = [
      [sides[:left][0], sides[:top][0], corners[:top_left]],
      [sides[:right][0], sides[:top][0], corners[:top_right]],
      [sides[:right][0], sides[:bottom][0], corners[:bottom_right]],
      [sides[:left][0], sides[:bottom][0], corners[:bottom_left]]
    ]
    side_pairs.each do |s|
      if s[0][:piece][0] == piece && s[1][:piece][0] == piece && s[2][:piece] == " "
        return s[2][:position]
      end
    end

    # encirclement
    # if two opposite corners taken take available corner
    pair1 = [corners[:top_left], corners[:bottom_right]]
    pair2 = [corners[:bottom_left], corners[:top_right]]

    pair1.each do |p|
      if pair2[0][:piece] == piece && pair2[1][:piece] == piece
        unless p[:piece] != " "
          return p[:position]
        end
      end
    end
    pair2.each do |p|
      if pair1[0][:piece] == piece && pair1[1][:piece] == piece
        unless p[:piece] != " "
          return p[:position]
        end
      end
    end
    # if nothing taken, returns nil
    return nil
  end
end

class String
  def prev #gets previous letter
    self[-1] = (self[-1].ord - 1).chr
    return self
  end
end
