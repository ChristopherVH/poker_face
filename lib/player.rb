class Player

  def initialize(hand)
    @hand = hand
  end

  def discard(card)
    discard_card(card)
    draw
  end

  def draw
  end

  def discard_card([2,1])
    @hand.delete(card[value,suit])
  end

  def fold
  end

  def raise
  end

  def [](value, suit)
    @hand.select {|card| card.display == [value,suit]}
  end

end
