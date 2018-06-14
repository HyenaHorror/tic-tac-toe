require_relative 'methods.rb'

board = Board.new

def display_board(board)
  b = board.return_board
  system "clear"
  puts """
  #{b["A1"]} | #{b["A2"]} | #{b["A3"]}
  ---------
  #{b["B1"]} | #{b["B2"]} | #{b["B3"]}
  ---------
  #{b["C1"]} | #{b["C2"]} | #{b["C3"]}
  """
  get_next_move_pvp
end

puts "Welcome to Tic-Tac-Toe!\n\n(Player vs Player only)"
puts "Ready to play?"
ready = gets.chomp
if ready.downcase == "y" || ready.downcase == "yes" || ready.downcase == "yeah"
  #move on
else
  puts "Goodbye!"
end
