require './lib/hangman.rb'
require 'sinatra'
require 'sinatra/reloader' if development?


configure do 
  enable :sessions
  set :session_secret, "secret"
end

get '/' do 
  erb :index
  @session = session

end

get '/submit' do
  

end

