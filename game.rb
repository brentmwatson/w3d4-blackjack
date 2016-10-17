#*************** Blackjack game *******************
# =>      Created by: Brent Watson
# =>             For: The Iron Yard
# =>           Notes: Week 3 Weekend Project
#**************************************************

#*************** Contents *************************
# =>        Class 'Game'
# =>          Attributes
# =>          Initialize
# =>          Game Logic/Loops section
# =>          User Display section
# =>          Game Play Methods section
# =>          User Selection Validation Section
#**************************************************
require_relative "deck"

class Game
  attr_accessor :deck,
                :player_hand,
                :dealer_hand
  def initialize
    self.deck = Deck.new
    self.player_hand = []
    self.dealer_hand = []
  end
#*********** Game Logic/Loop Section ********************
  def play
    prompt
    display_game_end
    play_again?
    exit_game
  end

  def play_game
    self.player_hand = []
    self.dealer_hand =[]
    2.times do
      #deal cards into hands
      player_hand << deck.deal
      dealer_hand << deck.deal
    end
      #score cards and pass into local variables
      player_hand = player_current_hand_score
      dealer_hand = dealer_current_hand_score
#Am I writing over my variables ni the array to be a single score number?
      display_game
      if dealer_current_hand_score == 21
        puts " Dealer has Backjack! Dealer wins."
      elsif player_current_hand_score < 21
          want_to_be_delt = "flub"
        while want_to_be_delt != "no"
          while player_current_hand_score < 21
            puts "Would you like a 'hit?'"
            puts "Enter option: yes OR no"
            want_to_be_delt = gets.chomp.downcase #get/store variable???
            validate_hit (want_to_be_delt)
            player_hand = player_current_hand_score
            display_game
          end
        end
      elsif player_current_hand_score == 21
          puts "You have Blackjack! You Win!"
          display_game_end
      elsif dealer_current_hand_score < 16
        while dealer_current_hand_score <16
          dealer_hand << deck.deal
          dealer_hand = dealer_current_hand_score
          puts "Dealer Hits!"
        end
        display_game
      elsif dealer_current_hand_score > 21
        puts "Dealer Bust! You win."
      else
        while player_current_hand_score > dealer_current_hand_score
        puts "You Win!"
        end
        puts "You Lose."
      end
  end
#*********** User Display Section ********************
  def prompt
    puts "Lets play blackjack"
    puts "Want be delt a hand? "
    puts "Enter option: Yes OR No"
    want_to_be_delt = gets.chomp.downcase #get/store variable???
    validate_prompt (want_to_be_delt)
  end

  def display_game
    # show player
    puts "Dealer showing: #{hand_simplify(dealer_hand.drop(1))}"#how to diplay all index in array
    puts "You're Showing: #{hand_simplify(player_hand.drop(1))}"
    puts "You hand: #{player_hand.fetch(0)}"
    puts "------------------------------------"
    puts "You are at: #{player_current_hand_score}\n\n"
  end

  def display_game_end
    # show player
    puts "Dealer hand: #{hand_simplify(dealer_hand)}"#how to diplay all index in array
    puts "You're hand: #{hand_simplify(player_hand)}"
    puts "------------------------------------"
    puts "You are at: #{player_current_hand_score}\n\n"
  end
  def play_again?
    puts "Would you like to Play again?"
    puts "Enter option: yes OR no"
    want_to_be_delt = gets.chomp.downcase
    validate_prompt (want_to_be_delt)
  end
#*********** Game Play Methods Section ********************
  def player_current_hand_score
    player_hand.inject(0) { |sum,card| sum + card.value }
  end

  def dealer_current_hand_score
    dealer_hand.inject(0) { |sum,card| sum + card.value }
  end

  def hand_simplify(hand)
    hand.collect { |card| card.to_s }.join(", ")
  end
  def exit_game
    exit
  end
#*********** User Selection Validation Section ********************
  def validate_hit (want_to_be_delt)
    if want_to_be_delt == "yes"
      player_hand << deck.deal
      puts "You are at: #{player_current_hand_score}\n\n"
    elsif want_to_be_delt == "no"

    else
      puts "Please enter 'Yes' or 'No'"
      want_to_be_delt = gets.chomp.downcase #get/store variable???
      validate_hit (want_to_be_delt)
    end
  end

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
  end
  # End of Class
end
#*********** Class/Call file  Section ********************
Game.new.play
