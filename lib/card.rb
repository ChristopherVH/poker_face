class Card
  attr_reader :value, :suit

  SUITS = {
    1 => :spades,
    2 => :hearts,
    3 => :diamonds,
    4 => :clubs
  }

  VALUES = {
    2 => :two,
    3 => :three,
    4 => :four,
    5 => :five,
    6 => :six,
    7 => :seven,
    8 => :eight,
    9 => :nine,
    10 => :ten,
    11 => :jack,
    12 => :queen,
    13 => :king,
    14 => :ace
  }

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def suit
    SUITS[@suit]
  end

  def display
    [@value, @suit]
  end
end
