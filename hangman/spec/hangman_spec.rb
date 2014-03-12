require 'rspec'
require 'hangman'

describe Game do
  describe 'word_maker' do
    it 'should start a new game with a word to guess' do
      game = Game.new
      game.word_maker('fruit')
      game.word.should == 'fruit'
    end
  end
  describe 'letter_guess' do
    it 'should let the player guess a letter' do
      game = Game.new
      game.word_maker('fruit')
      game.letter_guess('f').should == true
      game.letter_guess('x').should == false
    end
  end

  describe 'random_word' do
    it 'should set word to a random word from the random words list' do
      game = Game.new
      game.word_maker(game.random_word)
      game.random_words.should include game.word
    end
  end

  describe 'display_incorrectly_guessed_letters and correctly guessed letters' do
    it 'should store the incorrectly guessed and correctly letters so far' do
      game = Game.new
      game.word_maker('fruit')
      game.letter_guess('j')
      game.letter_guess('r')
      game.letter_guess('z')
      game.incorrect_letters.should == ['j','z']
      game.correct_letters.should == ['r']
    end
  end

  describe 'game_lost' do
    it 'if the player has more than 5 wrong guess, the game is lost!' do
      game = Game.new
      game.word_maker('fruit')
      game.letter_guess('f')
      game.letter_guess('j')
      game.letter_guess('j')
      game.letter_guess('j')
      game.letter_guess('j')
      game.letter_guess('j')
      game.letter_guess('j')
      game.game_lost.should == true
    end
  end
  describe 'game_won' do
    it 'if the player guessed all of the letters than the player has won' do
      game = Game.new
      game.word_maker('better')
      game.letter_guess('b')
      game.letter_guess('e')
      game.letter_guess('t')
      game.letter_guess('r')
      game.game_won.should == true
    end
  end
end
