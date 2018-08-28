require 'sinatra'
require 'erb'
require_relative 'game.rb'
require_relative 'random_ai.rb'
require_relative 'sequential_ai.rb'
enable :sessions

get '/' do
  erb :select_mode
end

post '/game_settings' do
  session[:game] = Game.new
  # session[:game] = Board.new
  session[:player1] = params[:player1]
  session[:player2] = params[:player2]
  session[:current_piece] = "x"
  session[:current_turn] = 1
  session[:current_player] = session[:player1]

  puts "P1: #{params[:player1]}\nP2: #{params[:player2]}"
  puts "P1: #{params[:player1].class}\nP2: #{params[:player2].class}"

  redirect '/game'
end

get '/game' do
  puts session[:game].return_board
  puts "Check win: #{session[:game].check_win}"
  if session[:game].check_win == true
    #end game and return current player as winner
    # erb :winner, locals:{winner:session[:current_piece]}
  else
    erb :game, locals:{board:session[:game].return_board, size:3, player:session[:game].return_current_player}
  end
rescue
  redirect '/'
end

post '/make_move' do # for human players
  unless session[:current_player] = "human"
    redirect '/ai_move'
  end
  # session[:game].check_win

  type = session[:current_player]

  case type
  when 'human'
    session[:game].make_move(session[:game].return_current_player, params[:pos])
  when 'random_ai'
    session[:game].make_move(session[:game].return_current_player, params[:pos])
  when 'sequential_ai'
    # do sequential
  when 'unbeatable'
    # do unbeatable
  end

  session[:game].alt_player

  if session[:current_turn] = 2
    session[:current_player] = session[:player1]
  else
    session[:current_player] = session[:player2]
  end

  if session[:current_player] == 'human'
    redirect '/game'
  else
    redirect '/make_move'
  end
end
