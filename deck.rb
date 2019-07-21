class Deck
  attr_accessor :cards

  SUITS = ["\u2660", "\u2663", "\u2665", "\u2666"].freeze
  VALUES = (2..10).map(&:to_s) + %w[J Q K A]

  def initialize
    self.cards = SUITS.product(VALUES).map do |suit, value|
      Card.new(value, suit)
    end
    cards.shuffle!
  end
end
