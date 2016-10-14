require_relative "deck"  # => true

class Game

  attr_accessor :deck,         # => :deck
                :player_hand,  # => :player_hand
                :dealer_hand   # => nil

  def initialize
    self.deck = Deck.new
    self.player_hand = []
    self.dealer_hand = []
  end                      # => :initialize

  def play
    prompt
    play_game
    play_again?
    exit_game
  end            # => :play

  def prompt
    puts "Lets play blackjack"
    puts "Want be delt a hand? "
    puts "Enter option: Yes OR No"
    want_to_be_delt = gets.chomp.downcase #get/store variable???
    validate_prompt (want_to_be_delt)
  end                                  # => :prompt

  def validate_prompt (want_to_be_delt)
    if want_to_be_delt == "yes"
      play_game
    elsif want_to_be_delt == "no"
      exit_game
    else
      puts "Please enter 'Yes' or 'No'"
      want_to_be_delt = gets.chomp.downcase #get/store variable???
      validate_prompt (want_to_be_delt)
    end
  end                                    # => :validate_prompt

  def play_game
    2.times do
      player_hand << deck.deal
      dealer_hand << deck.deal
    end
    player_score = player_current_hand_score
    # show player
    puts "Dealer showing: #{dealer_hand.fetch(1)}"
    puts "You're Showing: #{player_hand.fetch(1)}"
    puts "You hand: #{player_hand.fetch(0)}"
    puts "------------------------------------"
    puts "You are at: #{player_score}"
    if player_current_hand_score < 21
      puts "Would you like a 'hit?'"
      puts "Enter option: Yes OR No"
      want_to_be_delt = gets.chomp.downcase #get/store variable???
      validate_hit (want_to_be_delt)
    else
      puts "You BUST. Dealer wins."
    end
  end                                             # => :play_game

  def current_hand_score (player_hand)
    player_hand.inject(0) { |sum,card| sum + card }
  end                                                # => :player_current_hand_score

  def validate_hit (want_to_be_delt)
    if want_to_be_delt == "yes"
      player_hand << deck.deal
    elsif want_to_be_delt == "no"
      exit_game
    else
      puts "Please enter 'Yes' or 'No'"
      want_to_be_delt = gets.chomp.downcase #get/store variable???
      validate_hit (want_to_be_delt)
    end
  end                                    # => :validate_hit


  def play_again?
    exit_game
  end              # => :play_again?

  def exit_game
    # how do i quit game
  end            # => :exit_game
end              # => :exit_game
