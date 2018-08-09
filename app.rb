require 'sinatra'
require 'erb'
require_relative 'game.rb'
enable :sessions

get '/' do
  erb :select_mode
end

post '/game_settings' do
  session[:game] = Game.new
  # session[:game] = Board.new
  player1 = [params:player1]
  player2 = [params:player2]
  session[:current_player] = "x"

  redirect 'game'
end

get '/game' do
  puts session[:game].return_board
  erb :game, locals:{board:session[:game].return_board, size:3}
end

post '/make_move' do
  session[:game].make_move(session[:current_player], params[:pos])
  # session[:game].check_win
  # session[:game].alt_player needs to be Game class
  
  redirect '/game'
end
get '/make_move2' do
  session[:game].make_move(session[:current_player], params[:pos])
  redirect '/game'
end
