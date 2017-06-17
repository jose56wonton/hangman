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
  def get_correct
    @correct_letters.join(" ")
  end
  def get_incorrect
    @incorrect_letters.join(" ")
  end
  def get_word_with_guesses
    temp = ""
    @word.split("").each do |letter|
      if @correct_letters.include?(letter)
        temp<<"#{letter} "
      else
        temp<<"_ "
      end
    end
    temp
  end
  def guess(guess)
    if @attempts > 0
      if @word.include?(guess)
        @correct_letters<<guess
      else
        @incorrect_letters<<guess
      end
      @attempts-=1
    end
  end
end
