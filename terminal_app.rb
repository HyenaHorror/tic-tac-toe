require_relative 'methods.rb'

$board = Board.new

def display_board
  b = $board.return_board
  system "clear"
  puts """
  #{b["A1"]} | #{b["A2"]} | #{b["A3"]}
  ---------
  #{b["B1"]} | #{b["B2"]} | #{b["B3"]}
  ---------
  #{b["C1"]} | #{b["C2"]} | #{b["C3"]}
  """
  if $board.check_win == true
    change_player
    puts "#{$current_player} wins!"
    play_again
  else
    get_next_move_pvp
  end
end

def play_again
  puts "Press Enter to play again."
  choice = gets.chomp
  if choice == ""
    $board = Board.new
    display_board
  end
end

def get_next_move_pvp
  success = false
  until success == true
    print "Enter your move player #{$current_player}\n> "
    move = gets.chomp.upcase

    fail_check = $board.make_move($current_player, move)

    if fail_check != "Invalid move!"
      succcess = true
      change_player
      display_board
    else
      puts "Invalid move!"
    end
  end
end

def change_player
  if $current_player == "X"
    $current_player = "O"
  else
    $current_player = "X"
  end
end

system "clear"
puts "Welcome to Tic-Tac-Toe!\n\n(Player vs Player only)"
puts "Ready to play?"
ready = gets.chomp
if ready.downcase == "y" || ready.downcase == "yes" || ready.downcase == "yeah"
  $current_player = "X"
  display_board
else
  puts "Goodbye!"
end
