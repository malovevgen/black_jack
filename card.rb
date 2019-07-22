class Card
  attr_accessor :value, :suit

  SUITS = ["\u2660", "\u2663", "\u2665", "\u2666"].freeze
  VALUES = (2..10).map(&:to_s) + %w[J Q K A]

  def initialize(value, suit)
    self.value = value
    self.suit = suit
  end

  def points
    if value =~ /\d+/
      value.to_i
    elsif value == 'A'
      11
    else
      10
    end
  end
end
