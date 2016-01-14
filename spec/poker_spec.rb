require 'rspec'
require 'poker'

describe Card do
  let(:jack) {Card.new(11,2)}
  it "has a number value" do
    expect(jack.value).to eq(11)
  end

  it "has a suit" do
    expect(jack.suit).to eq(:hearts)
  end
end

describe Deck do
  let(:deck) {Deck.new}

  it "has 52 cards" do
    expect(deck.cards.length == 52 && deck.cards.all? {|card| card.is_a? Card}).to be true
  end

  it "has all different cards" do
    expect(deck.cards.map {|card| card.display} == deck.cards.map {|card| card.display}.uniq).to be true
  end

end

describe Player do
  let(:hand) {[[2,1],[2,2],[2,3],[2,4],[3,1]]}
  let(:bob) {Player.new(hand)}

  it "has a hand of five cards" do
    expect(bob.hand.length).to eq(5)
  end

  it "has a default pot value of 50" do
    expect(bob.pot).to eq(50)
  end

  context "When player discards cards" do
    before(:each) do
      bob.discard_card([2,1])
      bob.discard_card([2,2])
      bob.discard_card([2,3])
    end

    it "will discard 3 cards they don't want" do
      expect(bob.hand & [[2,1],[2,2],[2,3]]).to eq([])
    end

    it "will not allow player to discard more than 3 times" do
      expect(bob.discard_card([2,4])).to raise_error
    end
  end

  context "Can replace discarded cards" do
    before(:each) do
      bob.discard_card([2,1])
      bob.draw
    end
    
    it "gives player new cards" do
      expect(bob.hand.length).to eq(5)
    end
  end


end
