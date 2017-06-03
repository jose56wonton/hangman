 require_relative 'lib/hangman.rb'

 puts "Hi there welcome to Hangman"
 puts "Do you want to 'load' an old game or 'start' a new one"
 game = Hangman.new
 loop do
    answer = gets.chomp
   if answer == "load"
     game.load_dat_game
     break
   elsif answer == "start"
     break
   else
     puts"Enter 'Load' or 'Start' Monkey Man!"
   end
 end

game.the_loop
