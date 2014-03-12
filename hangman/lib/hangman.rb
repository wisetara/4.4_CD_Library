class Game

  attr_accessor :word, :bad_guesses, :correct_guesses, :correct_letters, :incorrect_letters, :random_words, :incorrect_guesses, :ordered_letters

  def word_maker(word)
    @word = word
  end

  def random_word
    index = Random.new
    @word = @random_words[index.rand(0..@random_words.length-1)]
  end

  def letter_guess(letter)
    @word.each_char do |char|
      if letter == char
        @correct_guesses += 1
        @correct_letters << char
        return true
      end
    end
    @incorrect_letters << letter
    @bad_guesses +=1
    false
  end

  def reveal_guessed_word
    @correct_letters.each do |letter|
      @word.each_char do |char|
        if letter == char
          @ordered_letters << char
        end
      end

  end
  @ordered_letters.join('')
end

  def game_lost
    @bad_guesses > 5
  end

  def game_won
    @correct_guesses == @word.split('').sort.join('').squeeze.length
  end

   def initialize
    @ordered_letters =[]
    @bad_guesses = 0
    @correct_guesses  = 0
    @incorrect_letters = []
    @correct_letters = []
    @random_words = %w(acres
      adult
      advice
      arrangement
      attempt
      August
      Autumn
      border
      breeze
      brick
      calm
      canal
      cast
      chose
      claws
      coach
      constantly
      contrast
      cookies
      customs
      damage
      deeply
      depth
      discussion
      doll
      donkey
      essential
      exchange
      exist
      explanation
      facing
      film
      finest
      fireplace
      floating
      folks
      fort
      garage
      grabbed
      grandmother
      habit
      happily
      heading
      hunter
      image
      independent
      instant
      January
      kids
      label
      lungs
      manufacturing
      mathematics
      melted
      memory
      mill
      mission
      monkey
      Mount
      mysterious
      neighborhood
      nuts
      occasionally
      official
      ourselves
      palace
      plates
      poetry
      policeman
      positive
      possibly
      practical
      pride
      promised
      recall
      relationship
      remarkable
      require
      rhyme
      rocky
      rubbed
      rush
      sale
      satellites
      satisfied
      scared
      selection
      shake
      shaking
      shallow
      shout
      silly
      simplest
      slight
      slip
      slope
      soap
      solar
      species
      spin
      stiff
      swung
      tales
      thumb
      tobacco
      toy
      trap
      treated
      tune
      vapor
      vessels
      wealth
      wolf
      zoo)
    end
end

