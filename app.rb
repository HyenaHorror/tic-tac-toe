require 'sinatra'
require 'erb'
require_relative 'game.rb'
enable :sessions

get '/' do
  erb :select_mode
end

post '/game_settings' do

  redirect '/game_start'
end

get '/game' do
  erb :game
end
