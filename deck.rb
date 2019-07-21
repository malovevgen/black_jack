class Deck
  attr_accessor :cards

  def initialize
    value = [*(2..10)] + %w{ J, Q, K, A }
    suit = ["\u2660", "\u2663", "\u2665", "\u2666"]
    deck_cards = suit.product(value)
    @cards = deck_cards.shuffle
  end
end
