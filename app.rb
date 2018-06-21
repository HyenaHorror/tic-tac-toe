require 'sinatra'
require 'erb'
require_relative 'game.rb'

get '/' do
  erb :game
end
