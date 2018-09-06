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
  puts params[:player2]
  player2 = params[:player2]

  session[:player1_type] = params[:player1]
  session[:player2_type] = player2

  case player2
  when 'random'
    session[:player2] = RandomAI.new
  when 'sequential'
    session[:player2] = SequentialAI.new
  end


  session[:current_piece] = "x"
  session[:current_turn] = 1
  session[:current_player] = session[:player1_type]
  redirect '/game'
end

get '/game' do
  puts session[:game].return_board
  puts "Check win: #{session[:game].check_win}"

  erb :game, locals:{board:session[:game].return_board, size:3, player:session[:game].return_current_player}
rescue
  redirect '/'
end

get '/end' do
  erb :winner, locals:{board:session[:game].return_board,size:3,winner:session[:game].return_current_player}
rescue
  redirect '/'
end
get '/draw' do
  erb :draw, locals:{board:session[:game].return_board,size:3}
rescue
  redirect '/'
end

post '/make_move' do # for human players
  puts "params: #{params}"
  # session[:game].check_win

    session[:game].make_move(session[:game].return_current_player, params[:pos])

  session[:game].alt_player

  if session[:current_turn] == 2
    session[:current_player] = session[:player1_type]
    session[:current_turn] = 1
  else
    session[:current_player] = session[:player2_type]
    session[:current_turn] = 2
  end

  if session[:game].check_win == true
    session[:game].alt_player
    redirect '/end'
  elsif session[:game].check_draw == true
    redirect '/draw'
  elsif session[:current_player] == 'human'
    redirect '/game'
  else
    redirect '/ai_move'
  end
rescue
  redirect '/'
end

get '/ai_move' do
  type = session[:current_player]
  puts "type: #{type}"
  case type
  when 'random', 'sequential'
    session[:player2].make_move(session[:game], session[:game].return_current_player)
    # session[:game].make_move(session[:game].return_current_player, params[:pos])
  # when 'sequential'
  #   session[:player2].make_move(session[:game], session[:game].return_current_player)
  when 'unbeatable'
    # do unbeatable
  end
  session[:game].alt_player

  if session[:current_turn] == 2
    session[:current_player] = session[:player1_type]
    session[:current_turn] = 1
  else
    session[:current_player] = session[:player2_type]
    session[:current_turn] = 2
  end
  if session[:game].check_win == true
    session[:game].alt_player
    redirect '/end'
  else
    redirect '/game'
  end
end
