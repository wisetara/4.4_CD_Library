require './lib/hangman'

 @game = Game.new
 puts @game
 @game.word_maker(@game.random_word)

def mainmenu

  if @game.game_lost
    puts 'you lost'
    puts @game.word
  elsif @game.game_won
    puts @game.word
    puts 'you won'
  else
    puts 'make a guess'
    guess = gets.chomp
    @game.letter_guess(guess)
     puts "these are your correct guesses"
    @game.correct_letters.each do |letter|
    puts letter
    end
    puts "\n"
    puts "these are your incorrect guesses"
    @game.incorrect_letters.each do |letter|
    puts letter
    end
    puts "\n"
    mainmenu
  end
end

mainmenu


