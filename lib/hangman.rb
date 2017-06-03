class Hangman

  attr_accessor :word, :word_length, :attempts, :correct_letters, :incorrect_letters


  def initialize
    @word = get_random_word
    @word_length = @word.length
    @attempts = 12
    @correct_letters = []
    @incorrect_letters = []


  end

  def get_random_word
    arr = []
    File.open("5desk.txt") do |file|
      words = file.readlines
      words_of_right_length = words.select{|word| word.strip.length.between?(5,12)}
      word = words_of_right_length.sample.strip
    end
  end

  def save_dat_game
    File.open('saved_game', 'w') do |file|
      file.puts Marshal::dump(self)
    end
    puts "Saved!"

  end
  def load_dat_game
    File.open('saved_game', 'r') do |file|
      if file.eof?
        puts "There was no saved game!"
        false
      else
        old_game = Marshal::load(file)
        @word = old_game.word
        @word_length = old_game.word_length
        @attempts = old_game.attempts
        @correct_letters = old_game.correct_letters
        @incorrect_letters = old_game.incorrect_letters
        puts "Game Loaded"
        true
      end

    end
  end
  def victory?
    count = 0
    @word.split("").each do |letter|
      if @correct_letters.include?(letter)
        count+=1
      end
    end
    if count == @word.length
      true
    else
      false
    end

  end

  def the_loop
    while @attempts > 0 do
      system "clear"
      puts "Number of guesses left = #{@attempts}"


      puts "Correct letters: #{@correct_letters.join(", ")}"
      puts "Incorrect letters: #{@incorrect_letters.join(", ")}\n\n"

      @word.split("").each do |letter|
        if @correct_letters.include?(letter)
          print "#{letter} "
        else
          print "_ "
        end
      end



      loop do
        puts "\n\nWhat is your next guess?(enter save if you want to play this game later!)"
        guess = gets.chomp
        if guess == "save"
          save_dat_game
          exit
        elsif  guess.length != 1
          puts "Please enter just one letter"
        elsif @correct_letters.include?(guess) || @incorrect_letters.include?(guess)
          puts "Please enter a new letter"
        else
          if @word.include?(guess)
            @correct_letters<<guess
          else
            @incorrect_letters<<guess
          end
          break
        end
      end


      if victory?
        puts "Good game friend!"
        puts "You won in #{12-@attempts} attempts"
        break
      else
        @attempts-=1
      end


    end
    if victory?
      puts "Nice Job guessing #{@word}"
    else
      puts "Bummer! The word was: #{@word}"
    end
  end
end
