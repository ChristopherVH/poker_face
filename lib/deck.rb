# require 'byebug'
require_relative 'card'

class Deck

  attr_reader :cards

  def initialize
    @cards = []
    populate
    shuffle
  end

  def populate
    cards = []

    (2..14).each do |card_val|
      (1..4).each do |suit|
        cards << Card.new(card_val, suit)
      end
    end

    @cards = cards
  end

  def shuffle
    @cards.shuffle
  end

end
