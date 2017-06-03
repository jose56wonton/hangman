# Hangman

This is a command line based game that was designed to work on Serialization.

It has 4 files
* `lib/hangman.rb` is the main source of ruby
  * `get_random_word` is a method that searches the 5desk.txt file for a word with
  a length between 5 and 12
  * `save_dat_game` is a method that serializes the hangman object with the Marshal
  class
  * `load_dat_game` is a method that de-serializes the hangman object
  * `victory?` is returns a boolean that is based on whether you have won or not
  * `the_loop` is the method that iterated the main functionality of the hangman
  class. It iterated until you are victorious or until you have killed a man.

* `5desk.txt` is a text file that holds 63000 words. Its functionally a dictionary
for this program

* `saved_game` is that file to which I am saving the hangman object in the case that
the user request such

* `start.rb` is how I am initializing the game. In it the user is given the option
to load a game or start a new one.

Use `ruby start.rb` to run the project

For more information on [Hangman](https://en.wikipedia.org/wiki/Hangman_(game))   

This project is part of [TheOdinProject's](http://www.theodinproject.com) Ruby track.
The project itself can be seen [here](https://www.theodinproject.com/courses/ruby-programming/lessons/file-i-o-and-serialization)!



```
