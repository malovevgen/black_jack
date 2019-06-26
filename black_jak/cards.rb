class Cards
  attr_accessor :cards

  def initialize
    value = [*(2..10)] + %w{ J, Q, K, A }
    suit = ["\u2660", "\u2663", "\u2665", "\u2666"]
    @cards = suit.product(value).shuffle
  end

  def deal_card
    @cards.shift
  end
end
