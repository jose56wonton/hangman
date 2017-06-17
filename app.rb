require './lib/hangman.rb'
require 'sinatra'
require 'sinatra/reloader' if development?


configure do
  enable :sessions
  set :session_secret, 'secret'
end

def new_game
  session.clear
  session[:game] = Hangman.new

end

get '/' do
  new_game if session[:game].nil?
  @game = session[:game]
  message = ""
  erb :index, locals: { correct: @game.get_correct,
                        incorrect: @game.get_incorrect,
                        word: @game.get_word_with_guesses,
                        attempts: @game.attempts,
                        message: message}

end
get '/submit' do
  new_game if session[:game].nil?
  @game = session[:game]
  @guess = params['guess']
  @game.guess(@guess)
  if(@game.victory?)
    message = "Nice Job!"
  elsif(@game.attempts == 0)
    message = "You are out of guesses my dood!"
  else
    message = ""
  end
	erb :index, locals: { correct: @game.get_correct,
                        incorrect: @game.get_incorrect,
                        word: @game.get_word_with_guesses,
                        attempts: @game.attempts,
                        message: message}


end
get '/reset' do
  new_game
  @game = session[:game]
  message = ""
  erb :index, locals: { correct: @game.get_correct,
                        incorrect: @game.get_incorrect,
                        word: @game.get_word_with_guesses,
                        attempts: @game.attempts,
                        message: message}
end
