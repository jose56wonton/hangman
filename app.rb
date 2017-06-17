require './lib/hangman.rb'
require 'sinatra'
require 'sinatra/reloader' if development?


configure do
  enable :sessions
  set :session_secret, 'secret'
end

get '/' do
  session[:game] = Hangman.new #if session[:game].nil?
	@game = session[:game]
  @correct = @game.get_correct
  @incorrect = @game.get_incorrect
  @word = @game.get_word_with_guesses


	erb :index
end
get '/submit' do
  session[:game] =Hangman.new if session[:game].nil?
  @guess = params['guess']
  @game = session[:game]
  @game.guess(@guess)
  @correct = @game.get_correct
  @incorrect = @game.get_incorrect
  @word = @game.get_word_with_guesses


	erb :index

end
