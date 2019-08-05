class Deck
  attr_accessor :cards, :deck_is_empty

  def initialize
    self.cards = Card::SUITS.product(Card::VALUES).map do |suit, value|
      Card.new(value, suit)
    end
    cards.shuffle!
  end
end
